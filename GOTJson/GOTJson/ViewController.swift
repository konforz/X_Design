//
//  ViewController.swift
//  GOTJson
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
        
        var gotArray: [Episodes] = []
    
    @IBOutlet weak var tableview: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        self.gameofthrones(withEpisodes: "season")  { (gameofthronesArray) in
            print(gameofthronesArray)
        self.gameofthrones(withEpisodes: "number") {(gameofthronesArray) in
                print(gameofthronesArray)
            self.gameofthrones(withEpisodes: "name") {(gameofthronesArray) in
                print(gameofthronesArray)
                
                
            }
            }
       
        }
    }
    
    func gameofthrones (withEpisodes episodes: String, completion: @escaping([GameOfThrones])->()) {
        
        let Path = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"

        let Ask = URLRequest(url: URL(string: Path)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
            guard let data = data else {return}
            let gotArray = try? JSONDecoder().decode([Episodes].self, from: data)
            guard let EP = gotArray else {
                print("something went wring")
                return
           }
            self.gotArray = EP
            DispatchQueue.main.async {
                self.tableview.reloadData()
}
}.resume()
}
}


extension ViewController: UITableViewDataSource {
    func tableview(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let Got = gotArray[indexPath.row]
        cell.textLabel?.text = Got.season ?? nil
    }
    func tableview(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let Got = gotArray[indexPath.row]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArray.count
        cell.textLabel?.text = Got.number ?? nil
    }

    func tableview(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let Got = gotArray[indexPath.row]
        cell.textLabel?.text = Got.name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableview(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {

    // create a reference to your storyboard
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    // instantiate your viewcontroller using the storyboard reference
    let NextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    // i'd have a property on that VC that stores a Hint object
    //let triviaObjectProperty: TriviaObject
    // set the hint property, then when that VC's view did load gets called, the hint will already be there and vdl can call a setup func with it
    
    NextViewController.seasonUpdate = gotArray[indexPath.row].season
    NextViewController.nameUpdate = gotArray[indexPath.row].name
    NextViewController.numberUpdate = gotArray[indexPath.row].number
    NextViewController.timeUpdate = gotArray[indexPath.row].runtime
    NextViewController.premierUpdate = gotArray[indexPath.row].premier
    NextViewController.summaryUpdate = gotArray[indexPath.row].summary

    
    if let index = self.tableview.indexPathForSelectedRow {
        self.tableview.deselectRow(at: index, animated: true)
    }
    
    navigationController?.pushViewController(NextViewController, animated: true)
    
    
}
}


