//
//  UrlSessionModel.swift
//  AbercrombieFitchTest
//
//  Created by MCS on 9/20/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

class UrlSessionModel {
    
    var aFitchArray = [FitchItem]()
    

    func getData(_ completion: (() ->Void)?) {
       let Path = "https://www.abercrombie.com/anf/nativeapp/qa/codetest/codeTest_exploreData.json"
        let Ask = URLRequest(url: URL(string: Path)!)
        
        URLSession.shared.dataTask(with: Ask) {(data, response,_ ) in
            defer {completion?()}
    guard let data = data else {return}
            let FitchArray = try? JSONDecoder().decode([FitchItem].self, from: data)
            guard let allCategories = FitchArray else {
                print("something went wrong")
                return
            }
            self.aFitchArray = allCategories
            print(self.aFitchArray)
  
           
        }.resume()
}
    func numberOfItems() -> Int {
        return aFitchArray.count
    }
    
    func item(for index: Int) -> FitchItem {
        return self.aFitchArray[index]
    }

}

