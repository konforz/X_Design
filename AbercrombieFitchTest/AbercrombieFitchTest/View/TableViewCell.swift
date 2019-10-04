//
//  TableViewCell.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit


class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var topDescription: UILabel!
    
    @IBOutlet weak var promoMessage: UILabel!
    
    @IBOutlet weak var bottomDescription: UILabel!
    
    @IBOutlet weak var contentTitle: UILabel!
    
    var aFitchArray: [FitchItem] = []
   
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(true, animated: true)
 
        // Configure the view for the selected state
    }
    
    
}

