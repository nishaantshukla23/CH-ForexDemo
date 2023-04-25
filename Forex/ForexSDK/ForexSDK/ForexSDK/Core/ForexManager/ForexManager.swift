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
    
    // MARK: Private scope
    private var navigationHandler: NavigationHandler {
        return NavigationHandler.shared
    }
    
    var forexConfig: ForexConfig?
    
    weak var hostAppTopViewController: UIViewController?
    var isUserLoggedIn: Bool {
        return true
    }
    
    //temporary function
    public func testSDKForSwiftUI(navController: UINavigationController?) {
        let swiftUIViewController = UIHostingController(rootView: CurrencyConverterView(viewModel: CurrencyConverterViewModel(currencyConverterService: CurrencyConverterService())))
        navController?.pushViewController(swiftUIViewController, animated: true)

    }
}



