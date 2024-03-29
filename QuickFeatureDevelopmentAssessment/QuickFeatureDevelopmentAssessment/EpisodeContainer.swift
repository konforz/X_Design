//
//  EpisodeContainer.swift
//  QuickFeatureDevelopmentAssessment
//
//  Created by MAC on 6/6/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

protocol  Session {
    func getData(from url: URL, completion: ((Data?, Error?)-> Void)?)
}

extension URLSession: Session {
    func getData(from url: URL, completion: ((Data?, Error?)-> Void)?) {
        dataTask(with: url) { (data, _, error) in completion?(data, error)
    }.resume()
    }
    }

struct EpisodeContainer: Codable {
  let episodes: [Episode]
  
  enum EpisodeCodingKeys: String, CodingKey {
    case episodes
  }
  
  enum TopLevelCodingKeys: String, CodingKey {
    case topLevel = "_embedded"
  }
  
  init(from decoder: Decoder) throws {
    let topContainer = try decoder.container(keyedBy: TopLevelCodingKeys.self)
    let subContainer = try topContainer.nestedContainer(keyedBy: EpisodeCodingKeys.self, forKey: .topLevel)
    self.episodes = try subContainer.decode([Episode].self, forKey: .episodes)
  }
//    init (episode: [Episode]) {
//         episode.self
//    }
//    func encode(to encoder: Encoder) throws {
//        var topContainer = try encoder.container(keyedBy: TopLevelCodingKeys.self)
//        var subContainer = try topContainer.nestedContainer(keyedBy:
//            EpisodeCodingKeys.self, forKey: Episode)
//    }
}


struct Episode: Codable {
  let airDate: String
  let airStamp: String
  let name: String
  let runtime: Int
  let summary: String
  let image: String

    
    
  enum CodingKeys: String, CodingKey {
    case airDate = "airdate"
    case airStamp = "airstamp"
    case name
    case runtime
    case summary
    case image
    
  }
    enum imageCodingKeys: String, CodingKey {
        case original
        case medium
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let imageContainer = try container.nestedContainer(keyedBy: imageCodingKeys.self, forKey: .image)
        self.airDate = try container.decode(String.self, forKey: .airDate)
        self.airStamp = try container.decode(String.self, forKey: .airStamp)
        self.name = try container.decode(String.self, forKey: .name)
        self.runtime = try container.decode(Int.self, forKey: .runtime)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.image = try imageContainer.decode(String.self, forKey: .original)
        
}
    
//    init() {
//        airDate = ""
//        airStamp = ""
//        name = ""
//        runtime = 1
//        summary = ""
//        image = ""
//        
//    }

}
