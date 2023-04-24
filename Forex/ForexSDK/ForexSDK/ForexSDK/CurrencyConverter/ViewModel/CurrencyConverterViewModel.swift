//
//  CurrencyConverterViewModel.swift
//  ForexSDK
//
//  Created by panther on 18/04/23.
//

import Foundation
import Combine

class CurrencyConverterViewModel: ObservableObject {
    
    @Published var currencyConverter: CurrencyConverterResponse?
    private let currencyConverterService: CurrencyConverterService
    private var cancellables = Set<AnyCancellable>()
    
    init(currencyConverterService: CurrencyConverterService) {
        self.currencyConverterService = currencyConverterService
    }
    
    func convertCurrency(request: CurrencyConverterRequest) {
        currencyConverterService.convertCurrency(.convert, request)
            .sink { [weak self] value in
                switch value {
                case .failure:
                    self?.currencyConverter = nil
                case .finished:
                    break
                }
            } receiveValue: { [weak self] currency  in
                print("currency response", currency)
                self?.currencyConverter = currency
            }.store(in: &cancellables)

    }
}
