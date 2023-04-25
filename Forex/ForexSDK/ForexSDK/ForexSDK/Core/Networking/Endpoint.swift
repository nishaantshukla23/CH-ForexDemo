//
//  Endpoint.swift
//  CombineDemo
//
//  Created by panther on 17/04/23.
//

import Foundation

protocol Endpoint {
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    var apiKey: String {
        return "anpDuADtk0c7BpiRJI68oBNaxijKRxAL"
    }

    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = []
        return components
    }
    
    var request: URLRequest {   
        let url = urlComponents.url!
        var request = URLRequest(url: url,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        request.addValue(apiKey, forHTTPHeaderField: "apikey")
        return request
    }
    
}
