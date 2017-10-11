//
//  MainSplitViewController.swift
//  NoteBook
//
//  Created by LSMSE on 2017. 9. 13..
//  Copyright © 2017년 LSMSE. All rights reserved.
//

import UIKit

// make UISplitViewController in portrait on iPhone shows master VC instead detail VC
// from stackoverflow.com

class MainSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
