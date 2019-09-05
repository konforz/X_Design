//
//  imageDataManager.swift
//  ImageGram
//
//  Created by MCS on 9/2/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "ImageDataModel")
        container.loadPersistentStores { (_,_) in }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    private init() { }
    
    func getAllImages() -> [Images] {
        let fetchRequest: NSFetchRequest<Images> = Images.fetchRequest()
        let allImages = try? context.fetch(fetchRequest)
        return allImages ?? []
    }
}



