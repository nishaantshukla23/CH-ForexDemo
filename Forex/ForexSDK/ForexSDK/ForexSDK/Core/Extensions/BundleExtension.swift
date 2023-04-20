//
//  BundleExtension.swift
//  ForexSDK
//
//  Created by N Shukla on 20/04/23.
//

import Foundation

// MARK: -
extension Bundle {
    static let forexSDKBundle: Bundle = {
        return Bundle(identifier: "com.nishaantShukla.ForexSDK")
        //Bundle(for: type(of: Self.self))
    }() ?? Bundle.main

    static let host: Bundle = {
        return Bundle.main
    }()
}

