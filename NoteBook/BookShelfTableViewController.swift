//
//  BookShelfTableViewController.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 8. 16..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

class BookShelfTableViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    // MARK: Model
    
    // book list
    // we can add more of them to it over time
    private var books = [Book]()

    // will use the segue information to get the book story that we write
    @IBAction func addBook(from segue: UIStoryboardSegue) {
        if let editor = segue.source as? AddBookViewController {
            books.append(editor.book)
            tableView.reloadData() // call all of its UITableViewDataSource methods again
        }
    }
    
    /// MARK: UITableViewDataSource
    
    // the most important thing we need to do in a table view to get it working
    
    // get the data in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Book Cell", for: indexPath)
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }

    // MARK: - Navigation
    
    // segue; two important piece of information we need when we're preparing to segue to an MVC
    // 1. identifier : which segue
    // 2. what is the new MVC that this system just created for us that we're supposed to prepare
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destinationViewController = segue.destination
        if let navigaionController = destinationViewController as? UINavigationController {
            destinationViewController = navigaionController.visibleViewController ?? destinationViewController
        }
        
        /// Hooking up the Master with the Detail
        
        // look at the row and index it into our new model
        if let bookViewController = destinationViewController as? BookDetailViewController,
            let cell = sender as? UITableViewCell,
            let indexPath = tableView.indexPath(for: cell) {
                bookViewController.book = books[indexPath.row]
                bookViewController.navigationItem.title = books[indexPath.row].title
        } else if destinationViewController is AddBookViewController {
            // presentationController controlling the presentation itself
            if let popoverPresentationController = segue.destination.popoverPresentationController {
                popoverPresentationController.delegate = self
            }
        }
    }
    
    func adaptivePresentationStyle(
        for controller: UIPresentationController,
        traitCollection: UITraitCollection
        ) -> UIModalPresentationStyle
    {
        // when it's in landscape mode in iPhone(vertically compact), I want it to be popover
        if traitCollection.verticalSizeClass == .compact {
            return .none // do not adapt
        } else if traitCollection.horizontalSizeClass == .compact {
            return .overFullScreen // UIVisualEffect
            // .fullScreen is go over the whole screen, but let the one that I'm on top of show through, put a blur background
        } else {
            return .none
        }
    }
}
