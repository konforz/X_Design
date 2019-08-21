//
//  ViewController.swift
//  Extermination
//
//  Created by MCS on 8/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController  {
    
    
    var stuff = KillData()
    var exterminated = false
    var killsArray: [Kill] = []

    @IBOutlet weak var tableview: UITableView!
    @IBAction func Addkillitem(_ sender: Any) {
        
        let nextViewController = storyboard?.instantiateViewController(withIdentifier:
            "NextViewController") as! NextViewController
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
 
//    func updateString(with value: String){
//    guard let selectedRow = tableview.indexPathForSelectedRow?.row else{ return }
//    killsArray[selectedRow] = value(forKey: stuff)
//    tableview.reloadData()
//    }
//
//    func addNewString(with value: String){
//        killsArray.append(value)
//        tableview.reloadData()
//    }
//
//    func updateArray(with value: [Kill]){
//        killsArray = []
//        let arrayOfdeath = value
//        for items in arrayOfdeath {
//            guard let name = items.name else {return }
//            killsArray.append(name)
//        }
//        tableview.reloadData()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "KillCell")
        
}

}
extension ViewController: UITableViewDataSource{
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "killCell", for: indexPath)
        cell.textLabel!.text = "Row \(indexPath.row)"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
        
}
}
extension ViewController: UITableViewDelegate {
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController =
            storyboard.instantiateViewController(withIdentifier: "NextViewController")
                as! NextViewController
        
         navigationController?.pushViewController(nextViewController, animated: true)
    
}
}
