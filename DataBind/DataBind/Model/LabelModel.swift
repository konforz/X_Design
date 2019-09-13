//
//  LabelModel.swift
//  DataBind
//
//  Created by MCS on 9/13/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class TheLabel: UILabel {
    static let shared = TheLabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeLabel()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeLabel()
        
    }
    
    func initializeLabel() {
        
        self.textAlignment = .left
        self.font = UIFont(name: "Helvetica-Bold", size: 22)
        self.textColor = UIColor.white
        self.numberOfLines = 2
        
    }
    func updateLabel(with value: String) {
        
        self.text = value
        
    }
}
