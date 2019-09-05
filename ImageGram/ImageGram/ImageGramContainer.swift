//
//  ImageGramContainer.swift
//  ImageGram
//
//  Created by MCS on 8/30/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import Foundation
import UIKit


  class imageAPI {
    
    private static let _defaultSession = URLSession(configuration: .default)
    
    private static var _dataTask: URLSessionDataTask?
}
extension  imageAPI{
    
    enum Error: Swift.Error {
        case noData
        case jsonSerializationFailed(reason: String)
        case requestFailed(reason: String)
        case processingPhotosFailed(reason: String)
        case imageCreationFailed
    }
}

extension imageAPI.Error: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "No data returned with response"
        case .jsonSerializationFailed(let reason):
            return reason
        case .requestFailed(let reason):
            return reason
        case .processingPhotosFailed(let reason):
            return reason
        case .imageCreationFailed:
            return "Could not create image from returned data"
        }
    }
}

