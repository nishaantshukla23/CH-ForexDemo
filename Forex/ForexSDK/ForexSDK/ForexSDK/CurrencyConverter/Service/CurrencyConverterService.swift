//
//  CurrencyConverterService.swift
//  ForexSDK
//
//  Created by panther on 18/04/23.
//

import Foundation
import Combine


class CurrencyConverterService: CombineAPI {
    var session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session =  URLSession(configuration: configuration)
    }
    
    convenience init(){
        self.init(configuration: .default)
    }
    
    /*
     func convertCurrency(_ config: NetworkConfig) -> AnyPublisher<CurrencyConverterResponse, Error> {
     return execute(config.request, decodingType: CurrencyConverterResponse.self, retries: 2)
     }
     */
    
    func convertCurrency(_ config: NetworkConfig, _ request: CurrencyConverterRequest) -> AnyPublisher<CurrencyConverterResponse, Error> {
        let request = generateCurrencyConvertRequest(config: config, request: request)
        return execute(request, decodingType: CurrencyConverterResponse.self, retries: 2)
    }
    
    private func generateCurrencyConvertRequest(config: NetworkConfig, request: CurrencyConverterRequest)-> URLRequest {
        var urlComponents = URLComponents(string: config.base)!
        urlComponents.path = config.path
        urlComponents.queryItems = [
            URLQueryItem(name:"to",value: request.to),
            URLQueryItem(name:"from", value: request.from),
            URLQueryItem(name:"amount", value: request.amount)
        ]
        
        let url = urlComponents.url!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HttpMethods.GET.rawValue
        urlRequest.addValue(config.apiKey, forHTTPHeaderField: "apikey")
        return urlRequest
    }
}
