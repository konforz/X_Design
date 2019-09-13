//
//  ViewController.swift
//  LocalizationProject
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var translationLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        translationLabel.text = LocalizableStrings.helloPerson(person: "kaz")
        }
    }
    




