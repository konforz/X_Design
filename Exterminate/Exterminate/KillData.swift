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
    
    static let shared = KillData()
    
    var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "KillModel")
        container.loadPersistentStores(completionHandler: { (description, error) in
            print("Description container",description)
            if let error = error {
                print("Error container",error)
                fatalError("With unresolver: \(error)")
            }
        })
        print("the container its:", container)
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    func makeDeath(name: String) throws -> Kill {
        guard let entityDescription = NSEntityDescription.entity(forEntityName: "Kill", in: context) else {
            print("Core data error")
            throw CoreDataError.noSuchEntity

        }
        let newDeath = Kill(entity: entityDescription, insertInto: context)
        newDeath.name = name
        save(newDeath: newDeath)
        return newDeath
    }
    
    func exterminated(kill: Kill) {
        context.delete(kill)
        save(newDeath: kill)
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
        print("the container its on save:", self.context)
        print("the fucker:",context.hasChanges)
        if context.hasChanges {
            do {
                print("finally i can save!!!!!")
                try context.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }
}

