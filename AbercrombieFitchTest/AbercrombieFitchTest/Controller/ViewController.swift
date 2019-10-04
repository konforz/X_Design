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
    
 let aFitchArray: [FitchItem] = []
 let apiData = UrlSessionModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.dataSource = self
        scrollView.delegate = self
        scrollView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "reuseCell")

        
        self.apiData.getData {
            DispatchQueue.main.async {
                self.scrollView.reloadData()
            }
        }
        
//        DispatchQueue.main.async {
//            self.scrollView.reloadData()
//        }
    }
    }

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.apiData.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = scrollView.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath) as! TableViewCell
        let item = self.apiData.item(for: indexPath.row)
         
        
        cell.title.text = item.title ?? ""
        cell.topDescription.text = item.topDescription ?? ""
        cell.promoMessage.text = item.promoMessage ?? ""
        cell.bottomDescription.text = item.bottomDescription ?? ""
        
    
        
        
        DispatchQueue.main.async {
            let cellImage = try? UIImage(data: NSData(contentsOf: NSURL(string:item.backgroundImage ?? "")! as URL) as Data)
            cell.pictureView.image = cellImage ?? nil
            
        }
        
        return cell
    }
    
    
}

extension ViewController: UIScrollViewDelegate, UITableViewDelegate {
    
//
//    func tableView(_ tableview: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
//        guard let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController else { return }
//
//                       navigationController?.pushViewController(nextViewController, animated: true)
//        self.scrollView.deselectRow(at: indexPath, animated: true)
//}
}

