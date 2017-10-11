//
//  BookDetailViewController.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 9. 8..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

class BookDetailViewController: UITableViewController, UIPopoverPresentationControllerDelegate {
    
    // MARK : Model
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var publisherLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    
    // Hooking up the Master with the Detail
    var book: Book?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authorLabel.text = book?.author ?? ""
        publisherLabel.text = book?.publisher ?? ""
        reviewLabel.text = book?.review ?? ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // will use the segue information to get the book story that we write
    @IBAction func editBook(from segue: UIStoryboardSegue) {
        if let editor = segue.source as? EditBookViewController {
            book = editor.book
            navigationItem.title = editor.book.title
        }
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
        
        if let editBookViewController = destinationViewController as? EditBookViewController {
            editBookViewController.editBook = book
        }
        
        if destinationViewController is EditBookViewController {
            // presentationController controlling the presentation itself
            if let popoverPresentationController = segue.destination.popoverPresentationController {
                popoverPresentationController.delegate = self
            }
        }
    }
}
