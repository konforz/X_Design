//
//  HahaData.swift
//  jokeable
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager {
    
    //1
    static let sharedManager = CoreDataManager()
    //2.
    private init() {} // Prevent clients from creating another instance.
    
    //3
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "JokeData")
        
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        print("the container contains:", container)
        return container
    }()
    
    //4
    func saveContext () {
        let context = CoreDataManager.sharedManager.persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                 print("system crash code:", error)
                
            }
        }
    }
}


