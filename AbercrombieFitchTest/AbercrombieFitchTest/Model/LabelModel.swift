//
//  UpdateModel.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/21/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class ApiUpdates: UIView {
    
    
    var theTitle: UILabel {
        let theTitle = UILabel()
        theTitle.text = arrayFitch.CodingKeys.title.rawValue
        return theTitle
    }
    var thePromoMessage: UILabel {
        let thePromoMessage = UILabel()
        thePromoMessage.text = arrayFitch.CodingKeys.promoMessage.rawValue
        return thePromoMessage
    }
    var theTopDescription: UILabel {
        let theTopDescription = UILabel()
        theTopDescription.text = arrayFitch.CodingKeys.topDescription.rawValue
        return theTopDescription
    }
    var theBottomDescription: UILabel {
        let theBottomDescription = UILabel()
        theBottomDescription.text = arrayFitch.CodingKeys.bottomDescription.rawValue
        return theBottomDescription
    }
    var theContentTitle: UILabel {
        let theContentTitle = UILabel()
        theContentTitle.text = Content.CodingKeys.title.rawValue
        return theContentTitle
    }
    var theContentTarget: UIButton {
        let theContentTarget = UIButton()
        return theContentTarget
    }
    var theElementType: UILabel {
        let theElementType = UILabel()
        theElementType.text = Content.CodingKeys.title.rawValue
        return theElementType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //
//    var titleUpdate: String?
//    var promoMessageUpdate: String?
//    var topDescriptionUpdate: String?
//    var bottomDescriptionUpdate: String?
//    var contentTargetUpdate: String?
//    var elementTypeUpdate: String?
    
    func updateLabelString() {
        
        theTitle.frame = CGRect()
        addSubview(theTitle)
        
        thePromoMessage.frame = CGRect()
        addSubview(thePromoMessage)
        
        theTopDescription.frame = CGRect()
        addSubview(theTopDescription)
        
        theBottomDescription.frame = CGRect()
        addSubview(theBottomDescription)
        
        theContentTitle.frame = CGRect()
        addSubview(theContentTitle)
        
        theContentTarget.frame = CGRect()
        addSubview(theContentTarget)
        
        theElementType.frame = CGRect()
        addSubview(theElementType)
        
        
    }
}
