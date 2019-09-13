//
//  ViewController.swift
//  localization
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textLabel.text = NSLocalizedString("helloWorldText", comment: "")
    }


}

