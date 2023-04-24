//
//  CurrencyModelData.swift
//  CurrencyConverter
//
//  Created by Ranu Dhurandhar on 17/04/23.
//

import Foundation
import Combine

public class CurrencyModelData: ObservableObject{
    @Published var currencies: [CurrencyModel] = load(forName: "Common-Currency.json")
    
}


func load<T: Decodable>(forName name: String) -> T {

    var data: Data
        let bundle = Bundle(for: CurrencyModelData.self)
        guard let filePath = bundle.path(forResource: name, ofType: nil) else {
                        fatalError("Couldn't find \(name) in main bundle.")
                    }
            do {
                let fileUrl = URL(fileURLWithPath: filePath)
                data = try Data(contentsOf: fileUrl)
                    } catch {
                        fatalError("Couldn't load \(name) from main bundle:\n\(error)")
                    }
            do {
                let decoder = JSONDecoder()
                    return try decoder.decode(T.self, from: data)
                } catch {
                    fatalError("Couldn't parse \(name) as \(T.self):\n\(error)")
                }
}
