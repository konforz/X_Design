//
//  TableViewCell.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
 var aFitchArray: [fitchArrays] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let dataCells: arrayFitch? = nil
        let cellImage = try? UIImage(data: NSData(contentsOf: NSURL(string: (dataCells?.backgroundImage ?? nil)! )! as URL) as Data)
        imageView?.image = cellImage
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

