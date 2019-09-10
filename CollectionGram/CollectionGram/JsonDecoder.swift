//
//  JsonDecoder.swift
//  CollectionGram
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class searchRequest {
func findRepositories(matching query: String) {
    let api = "https://pixabay.com/api"
    let apiKey = "/?key=13466060-69767d8687e81218abbf53a42"
    let endpoint = "&q=\(query)&image_type=photo"
    let url = URL(string: api + apiKey + endpoint)
    let query: [String] = ["fruits", "cars", "planets", "jungle", "fish"]
  
    
let session = URLSession.shared
    
 
}
}
