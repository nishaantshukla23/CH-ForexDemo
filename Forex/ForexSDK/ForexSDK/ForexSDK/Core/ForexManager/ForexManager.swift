//
//  ForexManager.swift
//  ForexSDK
//
//  Created by N Shukla on 13/02/23.
//

import Foundation
import UIKit
import SwiftUI


public final class ForexManager {
    
    // MARK: Public Interface
    public static let shared = ForexManager()
    //temporary function
    public func testSDKForSwiftUI(navController: UINavigationController?) {
        let swiftUIViewController = UIHostingController(rootView: CurrencyConverterView(viewModel: CurrencyConverterViewModel(currencyConverterService: CurrencyConverterService())))
        navController?.pushViewController(swiftUIViewController, animated: true)

    }
}



