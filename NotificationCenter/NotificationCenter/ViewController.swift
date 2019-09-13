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
    var notificationID: UUID!
    override func viewDidLoad() {
        super.viewDidLoad()
    notificationID = NewNotificationCenter.shared.addObserver(for: "custom notification", eventNotifyClosure: wasNotified(with:))
        
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else {return}
        if let id = notificationID { NewNotificationCenter.shared.removeObserver(for: id) }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

    @objc func wasNotified(_ notification: NSNotification){
        print("I was notified of an event")
        print("new username is \(notification.userInfo?["username"])")
    }
    func wasNotified(with info: [String: Any]?) {
        print("I was notified of an event")
        print("new username is \(info?["username"])")
    }
}
