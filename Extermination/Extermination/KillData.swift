//
//  KillData.swift
//  Extermination
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import CoreData

class KillData {
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KillModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            print(description)
            print(error)
        })
        return container
    }()
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
}
    func makeDeath(name: String) throws -> Kill {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Kill", in: context) else { throw CoreDataError.noSuchEntity}
        let newDeath = Kill(entity: entityDescription, insertInto: context)
        newDeath.name = name
        
        save(newDeath: newDeath)
        return newDeath
}


    func getAllKills() -> [Kill] {
        let fetchRequest = NSFetchRequest<Kill>(entityName: "Kill")
        let kills = try? context.fetch(fetchRequest)
        return kills ?? []
    }
    func save(newDeath: Kill) {
        guard context.hasChanges else {return}
        try? context.save()
    }
    
    func savecontext() {
        let container = self.persistentContainer
        container.viewContext.hasChanges
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
    
    enum CoreDataError: Error {
        case noSuchEntity
    
        
    }
    
    }

    
    

