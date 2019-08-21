//
//  NextViewController.swift
//  Extermination
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

protocol NextViewControllerDelegate{
    func updateString(with value: String)
    func updatenewString(with value: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var TextField: UITextField!
    
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    @IBAction func Submit(_ sender: Any) {
        
        func updateString(with value: String) {
            
        }
        
//      init save()
//        makeKillItem = killItem.text
//
//        try? stuff.Kill(whatToDo: makeToDoItem ?? "")
//        save()
        
        
        navigationController?.popToRootViewController(animated: true)
    }
}
