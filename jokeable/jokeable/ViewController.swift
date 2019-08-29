//
//  ViewController.swift
//  jokeable
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    var blacklistFlags: String?
    var haHaArray: [Categories] = []
    
    @objc func indexChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            print("Any");
        case 1:
            print("Fav");
        case 2:
            print("Dark");
        case 3:
            print("Program");
        case 4:
            print("Miscell")
        default:
            break
        }
    }
    
    @IBAction func addJoke(_ sender: UIBarButtonItem) {
        
        
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let items = ["Any" , "Fav", "Dark", "Program", "Miscell"]
        let segmentedControl = UISegmentedControl(items : items)
        segmentedControl.center = self.view.center
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(ViewController.indexChanged(_:)), for: .valueChanged)
        
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.backgroundColor = .red
        segmentedControl.tintColor = .yellow
        
        self.view.addSubview(segmentedControl)
    
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        self.Jokes(withCategories: "categories") { (haArray) in
            print(haArray)
        }
    }
    
    func Jokes (withCategories categories: String, completion: @escaping([HaHa])->()) {
        
        let catPath = "https://sv443.net/jokeapi/categories"
//        let missPath = "https://sv443.net/jokeapi/category/Any?blacklistFlags=nsfw"
//        let darkPath = "ttps://sv443.net/jokeapi/category/Dark?blacklistFlags=nsfw"
//        let progPath = "https://sv443.net/jokeapi/category/Programming?blacklistFlags=nsfw"
//        let anyPath = "https://sv443.net/jokeapi/category/Any?blacklistFlags=nsfw"
        
        let Ask = URLRequest(url: URL(string: catPath)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
            guard let data = data else {return}
           guard let ha = try? JSONDecoder().decode(HaHa.self, from: data)
             else {
                print("something went wrong")
                return
}
            DispatchQueue.main.async {
                 self.haHaArray = ha.categories
                self.tableView.reloadData()
            }
            }.resume()
}
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return haHaArray.count
}

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let haHa = haHaArray[indexPath.row]
        cell.textLabel?.text = haHa.anyJoke
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // create a reference to your storyboard
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        // instantiate your viewcontroller using the storyboard reference
        
        
        
}
}


