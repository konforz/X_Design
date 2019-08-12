//
//  ViewController.swift
//  T_View_Proj
//
//  Created by MCS on 8/8/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
NextViewControllerDelegate {
    func updateString(with value: String)
    {
        
    }
    

    @IBOutlet weak var TableView: UITableView!
    var array = ["hi", "hello", "goodbye",]
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        TableView.dataSource = self 
        TableView.delegate = self
        TableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        
        
        func updateString(with value: String) {
            guard let selectedRow = TableView.indexPathForSelectedRow?.row else {return}
        
        array[selectedRow] = value
            TableView.reloadData()
        }
    }

    
    }
                extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return array.count
        
                    
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:
        IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell (style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = array [indexPath.row]
return cell
        
}
}
    
extension ViewController:  UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        let tappedString = array[indexPath.row]
        nextViewController.editString = tappedString
        nextViewController.delegate = self
        //present(nextViewController, animated: true, completion: nil)
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    

}

