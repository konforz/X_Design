//
//  ViewController.swift
//  PushNotificationApp
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let notificationName = "Hamzah Khena"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CustomNotificationCenter.addObserver
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }
    }
    
}
