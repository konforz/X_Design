//
//  NewNotificationCenter.swift
//  NotificationCenter
//
//  Created by MCS on 9/12/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
final class NewNotificationCenter {
    static let shared = NewNotificationCenter()
    public var keyValue = 0
    public var observeID: Int = 0
    private init() { }
    
    var observerDictionary: [String: [Observer]] = [:]
//    var observers: [() -> Void] = []
    
    func addObserver(for event: String, eventNotifyClosure: @escaping ([String: Any]?) -> Void) ->UUID
    {
         let id = UUID()
        observerDictionary[event, default: []] +=
        [Observer(notifyClosure: eventNotifyClosure, id: id)]
        return id
        //}
//        if (observerDictionary[event] != nil) {
//            keyValue += 1
//
//        } else if (observerDictionary[event] == nil) {
//             keyValue = 0
//        }
////        if var observers = observerDictionary[event] {
//
//            observers.append(eventNotifyClosure)
//            observerDictionary[event]?.append(eventNotifyClosure)
//                observerDictionary[event] = [eventNotifyClosure]
//            
//        } else {
//            observerDictionary[event] =
//            [eventNotifyClosure]
//        }
        }
    
    func postEvent(named event: String, userInfo: [String: Any]? = nil) {
        guard let observers =
            observerDictionary[event] else { return }
        for observer in observers {
            observer.notifyClosure(userInfo)
        }
        
    }
    
    func removeObserver(for id: UUID) {
        for observers in observerDictionary {
            var mutableObservers = observers.value
            mutableObservers.removeAll(where: {$0.id == id})
            observerDictionary[observers.key] = mutableObservers
            }
        }
    
    struct Observer {
        let notifyClosure: ([String: Any]?) -> Void
        let id: UUID
    }
}
