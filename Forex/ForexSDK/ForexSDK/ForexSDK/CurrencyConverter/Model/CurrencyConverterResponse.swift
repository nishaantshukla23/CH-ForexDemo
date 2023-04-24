//
//  CurConverter.swift
//  ForexSDK
//
//  Created by panther on 18/04/23.
//


import Foundation

// MARK: - CurrencyConverter
struct CurrencyConverterResponse: Codable {
    let success: Bool
    let query: Query
    let info: Info
    let date: String
    let result: Double
}

// MARK: - Info
struct Info: Codable {
    let timestamp: Int
    let rate: Double
}

// MARK: - Query
struct Query: Codable {
    let from, to: String
    let amount: Int
}
