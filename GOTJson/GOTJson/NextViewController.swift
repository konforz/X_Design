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
    var premierUpdate: Int?
    var summaryUpdate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        season.text = "season: \(seasonUpdate ?? 0 )"
        name.text = "name: \(nameUpdate ?? "")"
        premier.text = "airdate: \(premierUpdate ?? 0 )"
        runtime.text = "runtime: \(timeUpdate ?? 0 )"
        number.text = "number: \(numberUpdate ?? 0)"
        summary.text = "summary: \(summaryUpdate ?? "")"
    
    }

private func setUpViewController(with got: Episodes) {
    // set all the outlets
    Int(season.text ?? nil) = got.season as!
    name.text = got.name
    Int(premier.text ?? nil)  = got.premier as!
    Int(runtime.text ?? nil) = got.runtime as!
    number.text = got.number
    summary.text = got.summary

}

