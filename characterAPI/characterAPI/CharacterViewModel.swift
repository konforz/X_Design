//
//  CharacterViewModel.swift
//  characterAPI
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct CharacterApiResponse: Codable {
    let characterArray: [Character]
    
    enum CodingKeys: String, CodingKey {
        case characterArray = "RelatedTopics"
    }
}
struct Character: Codable {
    let charName: String
    let charSummary: String
    let charImage: ImageInfo
    
    enum CodingKeys: String, CodingKey {
        case charName = "Text"
        case charSummary = "Result"
        case charImage = "Icon"
    }
}

struct ImageInfo: Codable {
    let urlString: String?
    
    enum CodingKeys: String, CodingKey {
        case urlString = "URL"
    }
}

