//
//  NextViewController.swift
//  Extermination
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol NextViewControllerDelegate{
    func updateString(with value: String)
    func updatenewString(with value: String)
    func deleteSelectedKill()
}

class NextViewController: UIViewController {
    
    
//    var didselect: String
//    var arrayindex: Int?
//    var stuff = KillData()
//    var toKillItem: [Any?]
//    var makeKillItem: String?
    var controlV: Int = 1
//    var arraykill: String = ""
    var killItem: String?
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var aliveOrDead: UISegmentedControl!
    //    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    @IBAction func aliveOrDeadControl(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            controlV = 1
        case 1:
            controlV = 0
        default:
            break
        }
    }
    @IBAction func Submit(_ sender: Any) {
        if killItem != nil {
            if controlV == 1 {
                delegate?.updateString(with: TextField.text!)
            } else {
                delegate?.deleteSelectedKill()
            }
        } else {
            delegate?.updatenewString(with: TextField.text!)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.text = killItem
    }
    
}
