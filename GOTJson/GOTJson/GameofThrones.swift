//
//  GotStruct.swift
//  GOTJson
//
//  Created by MCS on 8/16/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct GameOfThrones: Codable {
    let embedded: String?
    
}

struct embedded: Codable {
    let episodes: [Episodes]
}

struct Episodes: Codable {
    let name: String?
    let premier: Int?
    let runtime: Int?
    let season: Int?
    let number: Int?
    let summary: String?
    
}


