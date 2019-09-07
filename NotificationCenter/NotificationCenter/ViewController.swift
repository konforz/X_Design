//
//  ViewController.swift
//  NotificationCenter
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let customNotification = NSNotification.Name("custom notification")

    override func viewDidLoad() {
        super.viewDidLoad()
       
        NotificationCenter.default.addObserver(self, selector: #selector(wasNotified), name: ViewController.customNotification, object: nil)
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else {return}
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func wasNotified(_ notification: NSNotification){
        print("I was notified of an event")
        print("new username is \(notification.userInfo?["username"])")
    }
}

