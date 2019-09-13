//
//  CustomNotificationCenter.swift
//  PushNotificationApp
//
//  Created by MCS on 9/11/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
protocol NotificationProtocol {
    
    func update(with: String) 
}

class CustomNotificationCenter {
    var name = ViewController.notificationName
    var myDelegate: NotificationProtocol?
    var observerArray: [String] = []
    var evertArray: [String] = []
    
    func post( name: String, userInfo: String) {
        myDelegate?.update(with: name)
    }
    
    func addObserver(_ observer: NotificationProtocol,  name: String) {
        observerArray.append("\(observer)")
        evertArray.append(name)
    }

    
}

