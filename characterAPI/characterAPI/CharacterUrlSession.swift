//
//  CharacterDecoder.swift
//  characterAPI
//
//  Created by MCS on 9/4/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit



let ResponseURL = "https://api.duckduckgo.com/?q=burn%20notice%20characters&format=json&pretty=1"
var characterArray = [Character]()

func getData(_ completion: (() -> Void)?) {
    guard let characterAPIResponseURL = URL(string: ResponseURL.self  ) else {completion?()
return
        
}
    URLSession.shared.dataTask(with: characterAPIResponseURL) { data, _, Error in defer { completion?() }
        guard let data = data, Error == nil, let Container = try? JSONDecoder().decode (CharacterApiResponse.self, from: data) else {return}
        characterArray.self = Container.characterArray
    }


}
