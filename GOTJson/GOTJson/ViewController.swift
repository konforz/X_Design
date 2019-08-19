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
            
            guard let got = try? JSONDecoder().decode(GameOfThrones.self, from: data)
             else {
                print("something went wring")
                return
           }
            DispatchQueue.main.async {
                self.gotArray = got.embedded.episodes
                self.tableview.reloadData()
}
}.resume()
}
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gotArray.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let Got = gotArray[indexPath.row]
        cell.textLabel?.text = Got.name
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}



extension ViewController: UITableViewDelegate {
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {

    // create a reference to your storyboard
    let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
    // instantiate your viewcontroller using the storyboard reference
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }
    // i'd have a property on that VC that stores a Hint object
    //let triviaObjectProperty: TriviaObject
    // set the hint property, then when that VC's view did load gets called, the hint will already be there and vdl can call a setup func with it
    
    nextViewController.seasonUpdate = gotArray[indexPath.row].season ?? 0
    nextViewController.nameUpdate = gotArray[indexPath.row].name
    nextViewController.numberUpdate = gotArray[indexPath.row].number ?? 0
    nextViewController.timeUpdate = gotArray[indexPath.row].runtime ?? 0
    nextViewController.premierUpdate = gotArray[indexPath.row].airdate
    nextViewController.summaryUpdate = gotArray[indexPath.row].summary

    
//    if let index = self.tableview.indexPathForSelectedRow {
//        self.tableview.deselectRow(at: index, animated: true)
//    }
    
    navigationController?.pushViewController(nextViewController, animated: true)
    
    
}
}


