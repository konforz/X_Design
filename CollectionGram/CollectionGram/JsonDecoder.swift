//
//  JsonDecoder.swift
//  CollectionGram
//
//  Created by MCS on 9/6/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

func findRepositories(matching query: String) {
    let api = "https://pixabay.com"
    let apiKey = "/api/?key=13466060-69767d8687e81218abbf53a42"
    let endpoint = "/search/repositories?q=\(query)"
    let url = URL(string: api + apiKey + endpoint)
 //   &q=fruits&image_type=photo&pretty=true"
}
