//
//  NetworkConfig.swift
//  CombineDemo
//
//  Created by panther on 17/04/23.
//

import Foundation

enum NetworkConfig{
    case randomFeed
}

extension NetworkConfig: Endpoint {
    var base: String {
        return "https://api.quotable.io"
    }
    
    var path: String{
        switch self {
        case .randomFeed: return "/random"
        }
    }
}
