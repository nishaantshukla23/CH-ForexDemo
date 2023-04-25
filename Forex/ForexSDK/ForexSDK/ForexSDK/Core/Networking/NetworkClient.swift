//
//  NetworkLayer.swift
//  CombineDemo
//
//  Created by panther on 17/04/23.
//

import Foundation
import Combine
import UIKit

enum HttpMethods: String {
    case GET = "GET"
    case HEAD = "HEAD"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case CONNECT = "CONNECT"
    case OPTIONS = "OPTIONS"
    case TRACE = "TRACE"
    case PATCH = "PATCH"
}

protocol CombineAPI {
    var session: URLSession {get}
    func execute<T>(_ request: URLRequest, decodingType: T.Type, queue: DispatchQueue, retries: Int) -> AnyPublisher<T, Error> where T: Decodable
}

extension CombineAPI {
    
    func execute<T>(_ request: URLRequest, decodingType: T.Type, queue: DispatchQueue = .main, retries: Int) -> AnyPublisher<T, Error> where T: Decodable {
        return session.dataTaskPublisher(for: request)
            .tryMap{
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                          throw APIError.responseUnsuccessful
                      }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
        
    }
}
