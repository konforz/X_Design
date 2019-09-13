//
//  CategoryViewModel.swift
//  ImageGram
//
//  Created by MCS on 9/5/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit

 let fruitModel = FruitsModel().hits
 let carModel = CarsModel().hits
 let planetModel = PlanetsModel().hits
 let jungleModel = JungleModel().hits
 let fishModel = FishModel().hits

 let fruitData = FruitsModel().getData
 let carData = CarsModel().getData
 let planetData = PlanetsModel().getData
 let jungleData = JungleModel().getData
 let fishData = FishModel().getData



public var categoryArray: [Any] = [fruitModel, carModel, planetModel, jungleModel, fishModel]

public var getDataArray: [Any] = [fruitData, carData, planetData, jungleData, fishData]
