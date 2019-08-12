//
//  FilterSortClosureAssignment.swift
//  FilterClosureProject
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct FilterSortClosureAssignment {
  func sort(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
    var sortArray = array
    guard  !array.isEmpty   else {return []}
        
        
    for i in 0..<sortArray.count - 1 {
        for j in i+1..<sortArray.count {
            if sortClosure (sortArray [i], sortArray[j]) {
                sortArray.swapAt(i, j)
            }
            
        }
        
    }
    
    //TODO: Students fill out this function
    return sortArray
  }
  
  func filter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] 
    {
    
    let filterArray = [1,2,3]
    print(filterArray.filter({ $0 % 24 == 0 }))
    print(filterArray)
    //TODO: Students fill out this function
    
    return []
  }
  
  func test() {
    //Students may run tests here to make sure that theit functions work as expected.
  }
}
