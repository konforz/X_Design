//
//  ViewController.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/18/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UITableView!
    
    
    let model = ApiUpdates.self
 var aFitchArray: [fitchArrays] = []
 let apiData = UrlSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.dataSource = self
        scrollView.delegate = self
        scrollView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
        self.apiData.getData(withData: "Text") {
            (dataArray) in
        print(dataArray)
        }
        DispatchQueue.main.async {
            self.scrollView.reloadData()
        }
    }
    }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aFitchArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        let fitchCells = aFitchArray[indexPath.row]
        
        
        return cell
    }
    
    
}

extension ViewController: UIScrollViewDelegate, UITableViewDelegate {
    
    
    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }
        
                       navigationController?.pushViewController(nextViewController, animated: true)
        self.scrollView.deselectRow(at: indexPath, animated: true)
}
}

