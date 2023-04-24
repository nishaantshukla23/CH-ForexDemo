//
//  SelectedRow.swift
//  CurrencyConverter
//
//  Created by Ranu Dhurandhar on 18/04/23.
//

import SwiftUI

struct CurrencyCell: View {
    @EnvironmentObject var modelData: CurrencyModelData
    var currency: CurrencyModel
    var currencyIndex: Int {
        modelData.currencies.firstIndex(where: { $0.id == currency.id })!
       }
    var body: some View {
        HStack{
            Text(currency.code)
            Spacer()
            FavoriteButton(isSet: $modelData.currencies[currencyIndex].isFavorite)
        }
    }
}

struct CurrencyCell_Previews: PreviewProvider {
    static var currencys = CurrencyModelData()
    static var previews: some View {
       
        CurrencyCell(currency: currencys.currencies[0])
        
    }
}
