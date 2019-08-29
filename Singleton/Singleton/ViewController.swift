//
//  ViewController.swift
//  Singleton
//
//  Created by MCS on 8/14/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var triviaObjectArray: [TriviaObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "defaultCell")
        Jeopardy(withCategory: "title") { (hintsArray) in
            print(hintsArray)
        }
    }
    
    func Jeopardy (withCategory category: String, completion: @escaping([TriviaObject])->()) {
        
        let Path = "http://jservice.io/api/clues"
        
//        let url = Path + "/" + category
        let Ask = URLRequest(url: URL(string: Path)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
            guard let data = data else {return}
            let hints = try? JSONDecoder().decode([TriviaObject].self, from: data)
            guard let allHints = hints else {
                print("something went wring")
                return
            }
            self.triviaObjectArray = allHints
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            }.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return triviaObjectArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let triviaObject = triviaObjectArray[indexPath.row]
        cell.textLabel?.text = triviaObject.question + "/" + triviaObject.answer
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // create a reference to your storyboard
       let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        // instantiate your viewcontroller using the storyboard reference
        let NextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    
        
        NextViewController.updateQuestion = triviaObjectArray[indexPath.row].question
        NextViewController.updateAnswer = triviaObjectArray[indexPath.row].answer
        NextViewController.updateValue = triviaObjectArray[indexPath.row].value
        NextViewController.updateCategory = triviaObjectArray[indexPath.row].category.title
        NextViewController.updateAirDate = triviaObjectArray[indexPath.row].airdate
        NextViewController.updateCreationDate = triviaObjectArray[indexPath.row].created_at
        
    
        if let index = self.tableView.indexPathForSelectedRow {
            self.tableView.deselectRow(at: index, animated: true)
    }
        
        navigationController?.pushViewController(NextViewController, animated: true)
        
        
    }
}
