//
//  NetworkConfig.swift
//  CombineDemo
//
//  Created by panther on 17/04/23.
//

import Foundation

enum NetworkConfig{
    case convert
}


extension NetworkConfig: Endpoint {
    
    var apiKey: String {
        return "anpDuADtk0c7BpiRJI68oBNaxijKRxAL"
    }
    
    var base: String {
        return "https://api.apilayer.com"
    }
    
    var path: String{
        switch self {
        case .convert: return "/exchangerates_data/convert"
        }
    }
}
