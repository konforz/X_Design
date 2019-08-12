//
//  NextViewController.swift
//  T_View_Proj
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
    func updateString(with value: String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var theTextfield:
    UITextField!
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTextfield.text = editString
    }
    @IBAction func Submit(_ sender: Any) {
        delegate?.updateString(with: theTextfield.text ??
        "")
        navigationController?.popViewController(animated: true)
    }

}
