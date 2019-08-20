//
//  ViewController.swift
//  apiCaller
//
//  Created by MCS on 8/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func firstPage(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBOutlet weak var crawlerTableView: UITableView!
    
    var url: String? = "https://pokeapi.co/api/v2"
    var jsonDictionary: [String: Any] = [:] {
        didSet {
            dictionaryChanged = true
            
        }
    }
   
    var array: [[String:Any]] = [] {
        didSet {
            dictionaryChanged = false
        }
    }
     var dictionaryChanged = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crawlerTableView.dataSource = self
        crawlerTableView.delegate = self
        crawlerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "crawllerCell")
        guard let unwrappedURL = url,
        let url = URL(string: unwrappedURL)
        else {return}
        URLSession.shared.dataTask(with: url) { (data, _, _) in
        guard let data = data,
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {return}
            self.jsonDictionary = jsonObject      // we take the dictionary from url and call it                                            "jsonObject" and put it in jsonDictionsry
            DispatchQueue.main.async {
                self.crawlerTableView.reloadData()
            }
        }.resume()
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return !dictionaryChanged ? array.count : jsonDictionary.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexpath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "crawllerCell")
        if !dictionaryChanged {
            cell.textLabel?.text = "Index[\(indexpath.row)]"
        } else {
        let orderedKeys = jsonDictionary.keys.sorted()
        let currentKey = orderedKeys[indexpath.row]
        let currentValue = jsonDictionary[currentKey]
        cell.textLabel?.text = currentKey
            if let currentValueArray = currentValue as? [[String:Any]] {
            cell.detailTextLabel?.text = "Array with \(currentValueArray.count) elements"
            } else {
        cell.detailTextLabel?.text = "\(currentValue ?? "No value")"
        }
        }
        return cell
   
        }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !dictionaryChanged{
            let tappedElement = array[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController =
                storyboard.instantiateViewController(withIdentifier: "ViewController")
                    as! ViewController
            nextViewController.jsonDictionary = tappedElement
            nextViewController.url = nil
            navigationController?.pushViewController(nextViewController, animated: true)
        }
        else{
        let tappedKey = jsonDictionary.keys.sorted()[indexPath.row]
        if let tappedURL = jsonDictionary[tappedKey] as? String {
            
            if tappedURL.contains("pokeapi.co") {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier:
        "ViewController") as! ViewController
 //Go on to the next sreen after user selects cell ^
    nextViewController.url = tappedURL
        navigationController?.pushViewController(nextViewController, animated: true)
            }
            else {
                 let storyboard = UIStoryboard(name: "Main", bundle: nil)
            }
    }
    else if let tappedArray = jsonDictionary[tappedKey] as?
            [[String: Any]] {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier:
        "ViewController") as! ViewController
    //Go on to the next sreen after user selects cell 
    nextViewController.array = tappedArray
        nextViewController.url = nil
    navigationController?.pushViewController(nextViewController, animated: true)
        
}
}

}
}
