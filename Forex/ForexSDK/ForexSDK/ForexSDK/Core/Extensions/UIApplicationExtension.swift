//
//  UIApplicationExtension.swift
//  ForexSDK
//
//  Created by panther on 20/04/23.
//

import Foundation
import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
