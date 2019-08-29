//
//  MenuViewController.swift
//  Menu
//
//  Created by MCS on 8/28/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

final class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let menuOptions = ["Account", "Settings", "Help"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.dataSource = self
        menuTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    @IBAction func tappedGesture(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = menuOptions[indexPath.row]
        return cell
    }
    
    
}
