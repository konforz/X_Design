//
//  ImageGramViewController.swift
//  ImageGram
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit


final class FruitsModel {
    private let fruitsURL = "https://pixabay.com/api/?key=13466060-69767d8687e81218abbf53a42&q=fruits&image_type=photo&pretty=true"
     var hits = [Hits]()
    
  public  func getData(_ completion: (() -> Void)?) {
        guard let fruitsUrl = URL(string: self.fruitsURL) else {
            completion?()
            return
    }
    URLSession.shared.dataTask(with: fruitsUrl) { data, _, error in
    defer { completion?() }
    guard let data = data,
    error == nil,
    let theContainer = try? JSONDecoder().decode(FruitsContainer.self, from: data) else
    {return }
    self.hits = theContainer.hits
    }.resume()

struct FruitsContainer: Codable {
    let hits = [Hits]()
    
    enum CodingKeys: String, CodingKey {
        case hits
    }
    
        }
    }

struct Hits: Codable {
    let views: Int
    let likes: Int
    let comments: Int
    let userName: String
    let userImage: String
    let largeImage: String
    
    enum CodingKeys: String, CodingKey {
        case views
        case likes
        case comments
        case userName = "user"
        case userImage = "userImageURL"
        case largeImage = "largeImageURL"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.views = try container.decode(Int.self, forKey: .views)
        self.likes = try container.decode(Int.self, forKey: .likes)
        self.comments = try container.decode(Int.self, forKey: .comments)
        self.userName = try container.decode(String.self, forKey: .userName)
        self.userImage = try container.decode(String.self, forKey: .userImage)
        self.largeImage = try container.decode(String.self, forKey: .largeImage)
    }
}

}

