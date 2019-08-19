//
//  ViewController.swift
//  APIcrawl
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit
class ThirtyDayCell: UITableViewCell {
class ViewController: UITableViewController {
    
    let tableview: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = UIColor.white
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
        
        }()

    
    let cellId = "cellId"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupTableView() {
            tableview.delegate = self
            tableview.dataSource = self
       
       
    }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 100
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        let cell = tableview.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = UIColor.white
        return cell
    }
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }


    func TableViewsetup() {
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableview)
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: self.view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            tableview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            tableview.leftAnchor.constraint(equalTo: self.view.leftAnchor)
            ])
    }
    

}
class headerCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup(){
        
    }
    
    required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}

//func jason (withEpisodes episodes: String, completion: @escaping([JasonAttributes])->()) {
//
//    let Path = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes"
//
//    let Ask = URLRequest(url: URL(string: Path)!)
//
//    URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
//        guard let data = data else {return}
//
//        guard let got = try? JSONDecoder().decode(GameOfThrones.self, from: data)
//            else {
//                print("something went wring")
//                return
//        }
//        DispatchQueue.main.async {
//            self.gotArray = got.embedded.episodes
//            self.tableview.reloadData()
//        }
//        }.resume()
//}
//}
//
}

