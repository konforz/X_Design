//
//  TriviaObject.swift
//  Singleton
//
//  Created by MCS on 8/15/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

struct TriviaObject: Codable {
    let answer: String
    let question: String
    let value: Int?
    let category: Category
    let Category: String?
    let airdate: String
    let created_at: String
    
}

struct Category: Codable {
    let title: String
}
