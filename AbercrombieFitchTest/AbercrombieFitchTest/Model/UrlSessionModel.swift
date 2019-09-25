//
//  UrlSessionModel.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class UrlSession {
    
    var aFitchArray: [fitchArrays] = []

    func getData(withData arrayFitch: String, completion: @escaping([arrayFitch])->()) {
       let Path = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
        let Ask = URLRequest(url: URL(string: Path)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
    guard let data = data else {return}
            
//            guard let responseAPIUrl = try? JSONDecoder().decode(arrayFitch.self, from: data)  else {
//        print("something went wrong")
//        return
           
        }.resume()
}
   

}

