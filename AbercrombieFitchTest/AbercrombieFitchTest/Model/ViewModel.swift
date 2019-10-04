//
//  ViewModel.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
    

    struct FitchItem: Decodable {
        let title: String?
        let backgroundImage: String?
        let content: [Content]?
        let promoMessage: String?
        let topDescription: String?
        let bottomDescription: String?
        
        enum CodingKeys: String, CodingKey {
            case title
            case backgroundImage
            case promoMessage
            case topDescription
            case bottomDescription
            case content
        }
    }
    struct Content: Decodable {
        let target: String?
        let title: String?
//        let elementType: String?
        
        enum CodingKeys: String, CodingKey {
            case target
            case title
//            case elementType
        }
    }

