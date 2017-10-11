//
//  EditBookViewController.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 10. 3..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

class EditBookViewController: AddBookViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleTextField.text = editBook?.title
        authorTextField.text = editBook?.author
        publisherTextField.text = editBook?.publisher
        reviewTextField.text = editBook?.review
    }
    
    var editBook: Book?
}
