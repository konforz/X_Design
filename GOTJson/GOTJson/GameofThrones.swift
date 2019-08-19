//
//  GotStruct.swift
//  GOTJson
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct GameOfThrones: Codable {
    let embedded: Embedded
    
    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

struct Embedded: Codable {
    let episodes: [Episodes]
}

struct Episodes: Codable {
    let name: String?
    let airdate: String?
    let runtime: Int?
    let season: Int?
    let number: Int?
    let summary: String?
    
}


