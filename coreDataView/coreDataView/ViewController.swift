//
//  ViewController.swift
//  coreDataView
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stuff = DataStuff()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let container = stuff.persistentContainer
        print(container)
        do {
            let newDog = try stuff.makeDoggy(name: "Scooby Doo")
            print(newDog.name)
            stuff.save()
        } catch {
            print("There was an error! Error: \(error.localizedDescription)")
        }
        let allDogs = stuff.getAllDogs()
        for dog in allDogs {
            print(dog.name)
            
        }
        print(allDogs)
        stuff.killDog(dog: allDogs[1])
        // Do any additional setup after loading the view.
    }
 }

