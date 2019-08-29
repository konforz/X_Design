//
//  myTableViewCell.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MCS on 8/29/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var subtextLabel: UILabel!
    
    @IBOutlet weak var imageViewcell: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)

        // Configure the view for the selected state
    }
    
}
