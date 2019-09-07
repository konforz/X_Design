//
//  NextViewController.swift
//  GOTJson
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class NextViewController: UIViewController {
    
    private var got: Episodes?
    
    @IBOutlet weak var season: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var premier: UILabel!
    @IBOutlet weak var runtime: UILabel!
    @IBOutlet weak var number: UILabel!
    
    
    var seasonUpdate: Int?
    var nameUpdate: String?
    var numberUpdate: Int?
    var timeUpdate: Int?
    var premierUpdate: String?
    var summaryUpdate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        season.text = "season: \(seasonUpdate ?? 0 )"
        name.text = "name: \(nameUpdate ?? "No Value")"
        premier.text = "premier: \(premierUpdate ?? "") "
        runtime.text = "runtime: \(timeUpdate ?? 0 )"
        number.text = "episode: \(numberUpdate ?? 0)"
        summary.text = "summary: \(summaryUpdate ?? "No Value")"
    
    }

//private func setUpViewController(with got: Episodes) {
//    // set all the outlets
////    season.text ?? nil = got.season as!
////    name.text ?? nil = got.name as!
////    premier.text ?? nil  = got.premier as!
////    runtime.text ?? nil = got.runtime as!
////    number.text ?? nil = got.number
////    summary.text = got.summary
//
//}
}

