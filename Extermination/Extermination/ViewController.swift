//
//  ViewController.swift
//  Extermination
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, NextViewControllerDelegate {
    func updatenewString(with value: String) {
        //Fill in later
        try? stuff.makeDeath(name: value)
        stuff.save()
        killsArray = stuff.getAllKills()
        tableview.reloadData()
    }
    
    func deleteSelectedKill() {
        guard let selectedRow = tableview.indexPathForSelectedRow?.row else { return }
        stuff.killed(Kill: killsArray[selectedRow])
        killsArray = stuff.getAllKills()
        tableview.reloadData()
    }
    
    var stuff = KillData()
    var exterminated = false
    var killsArray: [Kill] = []
    var newDeath: [String] = []
    
    
    @IBOutlet weak var tableview: UITableView!
    @IBAction func Addkillitem(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =
            storyboard.instantiateViewController(withIdentifier: "NextViewController")
                as! NextViewController
//        nextViewController.killItem = nil
        nextViewController.delegate = self
        
        navigationController?.pushViewController(nextViewController, animated: true)
        

      }
    
    @IBAction func darkModeSwitch(_ sender: UIBarButtonItem) {
        
        
    }
    

    func updateString(with value: String){
        guard let selectedRow = tableview.indexPathForSelectedRow?.row else{ return }
        killsArray[selectedRow].name = value
        tableview.reloadData()
    }

    func addNewString(with value: String){
        let kill = try? stuff.makeDeath(name: value)
        print(kill!)
        killsArray.append(kill!)
        stuff.save()
        tableview.reloadData()
    }
    
    func updateArray(with value: [Kill]){
        killsArray = []
        let arrayOfdeath = value
        for items in arrayOfdeath {
            guard items.name != nil else {return }
            killsArray.append(items)
        }
        tableview.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "killCell")
        
        killsArray = stuff.getAllKills()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let killFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "KillModel")
        let getkilled = [killFetch]
        stuff.save()
         tableview.reloadData()
        // fetch from core data again
        // set the killsArray to the items from the fetch
        // reload the tableview
    }
    
}
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "killCell", for: indexPath)
//        cell.textLabel!.text = "Row \(indexPath.row)"
        cell.textLabel?.text = killsArray[indexPath.row].name
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return killsArray.count
        
    }
}
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =
            storyboard.instantiateViewController(withIdentifier: "NextViewController")
                as! NextViewController
        nextViewController.killItem = killsArray[indexPath.row].name
        nextViewController.delegate = self
        
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
}

//extension ViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let text = textField.text else { return }
//        addNewString(with: text)
//        updateString(with: text)
//        tableview.reloadData()
//    }
//}
