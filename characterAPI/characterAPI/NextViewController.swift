//
//  NextViewController.swift
//  characterAPI
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    @IBOutlet weak var summary: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!

    //let image = UIImage.self
    var char: Character? = nil
    
    var apiImage: UIImage? = nil
    var summaryUpdate: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.contentMode = UIImageView.ContentMode.scaleAspectFill
        
        summary.text = "summary: \(summaryUpdate ?? "")"
        
        let cellImage = try? UIImage(data: NSData(contentsOf: NSURL(string: (char?.charImage.urlString ?? nil)! )! as URL) as Data)
        
        imageView.image = cellImage
       
        
    }
    
}
