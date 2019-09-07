//
//  ViewController.swift
//  ImageGram
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
     let fruitModel = FruitsModel()
     let carModel = CarsModel()
     let planetModel = PlanetsModel()
     let jungleModel = JungleModel()
     let fishModel = FishModel()

 
    @IBOutlet weak var imageGramTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageGramTableView.dataSource = self
        self.imageGramTableView.delegate = self
        self.imageGramTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
        //self.episodeTableView.register(myTableViewCell.self, forCellReuseIdentifier: "Cell")
        self.planetModel.getData {
            DispatchQueue.main.async {
                self.imageGramTableView.reloadData()
            }
        }
        self.jungleModel.getData {
            DispatchQueue.main.async {
                self.imageGramTableView.reloadData()
            }
        }
        self.fishModel.getData {
            DispatchQueue.main.async {
                self.imageGramTableView.reloadData()
            }
        }
        self.carModel.getData {
            DispatchQueue.main.async {
                self.imageGramTableView.reloadData()
            }
        }
        self.fruitModel.getData {
            DispatchQueue.main.async {
                self.imageGramTableView.reloadData()
}
}
}
}

    extension ViewController: UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return 5//categoryArray.count
}
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! TableViewCell
            let fruitCell = fruitModel.hits[indexPath.section]
            let cellImage = try! UIImage(data: NSData(contentsOf: NSURL(string: fruitCell.userImage)! as URL) as Data)
            cell.imageViewCell.image = cellImage
            return cell
}
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let fruitCell = self.fruitModel.hits[indexPath.section]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
}
}
