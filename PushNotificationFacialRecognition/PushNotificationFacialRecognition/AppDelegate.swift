//
//  AppDelegate.swift
//  PushNotificationFacialRecognition
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import UserNotifications
import LocalAuthentication

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge])
//        { (allowed, _) in
//            guard allowed else {return}
//
//            DispatchQueue.main.async {
//            UIApplication.shared.registerForRemoteNotifications()
//            }
//        }
        print("started authentication")
        let context = LAContext()
        var error: NSError?
       guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) else { return true}
        switch context.biometryType {
        case .faceID:
            print("face id")
        case .touchID:
            print("touch id")
        case .none:
            print("none")
        @unknown default:
            print("i don't know. This is new to me!")
        }
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Cuz reasons. You a snitch?") { (authenticated, error) in
            if authenticated {
                
            } else {
                
            }
            print("The user was authenticated? \(authenticated)")
            print("There was an error! \(error?.localizedDescription ?? "No error")")
        }
        return true
    }
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken
        deviceToken: Data) {
        print(deviceToken)
    }
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}

