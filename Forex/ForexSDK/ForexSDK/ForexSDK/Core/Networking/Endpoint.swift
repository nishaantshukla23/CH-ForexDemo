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
        return "api_key=34a92f7d77a168fdcd9a46ee1863edf1"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
//        components.query = apiKey
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}
