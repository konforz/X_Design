//
//  ViewModel.swift
//  CollectionGram
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let hits: [Hits]
}
    struct Hits: Codable {
        let views: Int?
        let likes: Int?
        let comments: Int?
        let userName: String?
        let userImage: String?
        let largeImage: String?
        
        enum CodingKeys: String, CodingKey {
            case views
            case likes
            case comments
            case userName = "user"
            case userImage = "userImageURL"
            case largeImage = "largeImageURL"
        }
    }


