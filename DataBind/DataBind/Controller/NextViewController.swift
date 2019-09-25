//
//  NextViewController.swift
//  DataBind
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

protocol updateText {
     func updateLabel(with value: String)
}

 class NextViewController: UIViewController {
   static var nextViewModel = NextViewController()
    var name = TheLabel.shared
    @IBAction func popToRootView(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
TheLabel.shared.updateLabel(with: textField.text!)
        
}
}
