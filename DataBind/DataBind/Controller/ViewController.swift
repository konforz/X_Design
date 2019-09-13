//
//  ViewController.swift
//  DataBind
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

protocol nextView {
     
}

class ViewController: UIViewController {
    
    @IBOutlet weak var nextViewSwitch: UIBarButtonItem!

    
    @IBAction func pushNextView(_ sender: UIBarButtonItem) {
        
        var onTintColor: UIColor? = .black
        var isOn: Bool = true
        func setOn(_ on: Bool,
                   animated: Bool) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =
            storyboard.instantiateViewController(withIdentifier: "NextViewController")
                as! NextViewController
            if isOn == true {
        navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }
    
    var theLabel = TheLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        theLabel = TheLabel(frame: CGRect(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2, width: 100, height: 20))

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =
            storyboard.instantiateViewController(withIdentifier: "NextViewController")
                as! NextViewController
       navigationController?.pushViewController(nextViewController, animated: true)
        self.view.addSubview(theLabel)
     
    }


}

