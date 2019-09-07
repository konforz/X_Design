//
//  ImageGramFishModel.swift
//  ImageGram
//
//  Created by MCS on 9/1/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation

final class FishModel {
    private let fishURL = "https://pixabay.com/api/?key=13466060-69767d8687e81218abbf53a42&q=fish&image_type=photo&pretty=true"
     var hits = [Hits]()
    
    func getData(_ completion: (() -> Void)?) {
        guard let fishURL = URL(string: self.fishURL) else {
            completion?()
            return
        }
        
        URLSession.shared.dataTask(with: fishURL) {data, _, Error in
            defer {completion?()}
            guard let data = data,
                Error == nil,
                let theContainer = try? JSONDecoder().decode(FishContainer.self, from: data) else
            {return}
            self.hits = theContainer.hits
            }.resume()
        
        struct FishContainer: Codable {
            let hits = [Hits]()
            
            enum FishCodingKeys: String, CodingKey {
                case hits
            }
            init(from decoder: Decoder) throws {
                let FishContainer = try decoder.container(keyedBy: CodingKeys.self)
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

