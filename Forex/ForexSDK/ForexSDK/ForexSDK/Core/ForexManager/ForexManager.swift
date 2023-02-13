//
//  ForexManager.swift
//  ForexSDK
//
//  Created by N Shukla on 13/02/23.
//

import Foundation
import UIKit


public final class ForexManager {
    
    // MARK: Public Interface
    public static let shared = ForexManager()
    //temporary function
    public func testSDKAcces() {
        let alert = UIAlertController(title: "Hello, I am ForexSDK", message: "you got the access.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        let window = UIApplication.shared.windows.first
        let controller = window?.rootViewController
        controller?.present(alert, animated: true)
    }
}
