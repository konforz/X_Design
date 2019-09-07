//
//  ViewController.swift
//  characterAPI
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var charArray: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        self.getData(withData: "Text") {
            (dataArray) in
            print(dataArray)
        }
    }
    
    func getData(withData Character: String, completion: @escaping([Character])->()) {
        
        let Path = "https://api.duckduckgo.com/?q=burn%20notice%20characters&format=json&pretty=1"
        
        let Ask = URLRequest(url: URL(string: Path)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
            guard let data = data else {return}
            
            guard let apiResponse = try? JSONDecoder().decode(CharacterApiResponse.self, from: data)
                else {
                    print("something went wring")
                    return
                    
            }
            DispatchQueue.main.async {
                self.charArray = apiResponse.characterArray
                self.tableView.reloadData()
            }
            }.resume()
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return charArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        let char = charArray[indexPath.row]
        cell.textLabel?.text = char.charName
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }
        
        nextViewController.summaryUpdate = charArray[indexPath.row].charSummary
        nextViewController.char = charArray[indexPath.row]
        
        navigationController?.pushViewController(nextViewController, animated: true)
         self.tableView.deselectRow(at: indexPath, animated: true)
    }
}





