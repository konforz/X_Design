//
//  Haha.swift
//  jokeable
//
//  Created by MCS on 8/23/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct HaHa: Codable {
    let categories: [Categories]
    
}
struct Categories: Codable {
    let programming: String
    let dark: String
    let anyJoke: String
    let miscellaneous: String
    let setup: String
    let delivery: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case programming = "Programming"
        case dark = "Dark"
        case anyJoke = "Any"
        case miscellaneous = "Miscellaneous"
        case setup
        case delivery
        case category
       
    }
}

