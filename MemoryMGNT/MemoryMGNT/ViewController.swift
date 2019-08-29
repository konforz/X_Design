//
//  ViewController.swift
//  MemoryMGNT
//
//  Created by MCS on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var theObject = UIViewController()
    var hasPresented = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let person = Person(name: "Ryan")
        let dwelling = Abode(address: "NoSuchPlace")
        person.dwelling = dwelling
        dwelling.occupant = person
        print("end of view did load")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard !hasPresented else  {return}
        hasPresented = true
        let secondViewController = SecondViewController()
        print("presenting second view controller")
        present(secondViewController, animated: true, completion:  nil)
    }
}

class SecondViewController: UIViewController {
    deinit {
        print("second view controller has been deinitialized")
    }
    var count = 0
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("dismissing second view controller")
        dismiss(animated: true) {[weak self] in DispatchQueue.global().asyncAfter(deadline: .now() + 2, execute: {
        
            for number in 0...1000000 {
                self?.count += number
                print(self?.count)
            }} )
    }
    }

    }

    
class Person {
    var name: String
    var dwelling: Abode?
    
    deinit {
        print("The Person was murdered")
    }
    
    init(name: String) {
        self.name = name
    }
}


class Abode {
    var address: String
    weak var occupant: Person?
    
    deinit {
        print("The abode has been bulldozed")
    }
    
    init(address: String) {
        self.address = address
    }
}

