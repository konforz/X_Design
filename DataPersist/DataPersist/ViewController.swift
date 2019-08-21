//
//  ViewController.swift
//  DataPersist
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var darkMode: UILabel!
    
    @IBOutlet weak var darkModeSwitch: UISwitch!
    
    var isDarkModeEnabled: Bool {
        get {
            return UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
            
        }
        
        set {
            
            UserDefaults.standard.set(newValue, forKey: "isDarkModeEnabled")
        
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isDarkModeEnabled = UserDefaults.standard.bool(forKey: "isDarkModeEnabled")
        
       darkModeSwitch.isOn = isDarkModeEnabled
        updateUI()
    }
    
    private func updateUI(){
        if isDarkModeEnabled {
            darkMode.textColor = .white
            view.backgroundColor = .black
        }else{
            darkMode.textColor = .black
            view.backgroundColor = .white
        }
        
    }

    @IBAction func didTapDarkMode(_ sender: Any) {
        isDarkModeEnabled = !isDarkModeEnabled
       
        
    }
    
}

