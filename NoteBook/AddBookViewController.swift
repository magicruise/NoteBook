//
//  AddBookViewController.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 8. 30..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

class AddBookViewController: UITableViewController, UITextFieldDelegate {
    
    // MARK : Model
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var publisherTextField: UITextField!
    @IBOutlet weak var reviewTextField: UITextField!
    
    var book: Book {
        return Book(
            title: titleTextField?.text ?? "",
            author: authorTextField?.text ?? "",
            publisher: publisherTextField?.text ?? "",
            review: reviewTextField?.text ?? ""
        )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        presentingViewController?.dismiss(animated: true)
    }
}
