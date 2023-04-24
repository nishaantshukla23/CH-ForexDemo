//
//  CurrencyCodeModel.swift
//  CurrencyConverter
//
//  Created by Ranu Dhurandhar on 17/04/23.
//

import Foundation
import SwiftUI

struct CurrencyModel: Codable, Hashable, Identifiable  {
    var code: String
    var isFavorite: Bool
    var id: Int
}




