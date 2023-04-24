//
//  CurrencyList.swift
//  CurrencyConverter
//
//  Created by Ranu Dhurandhar on 17/04/23.
//

import SwiftUI

struct CurrencyList: View {
    @Binding var isPresented: Bool
    @Binding var codeValueFrom : String
    @Binding var codeValueTo : String
    @Binding var isFromcode: Bool
    @ObservedObject var codes = CurrencyModelData()
    
    var body: some View {
        List{
            ForEach(codes.currencies, id: \.self) { currency in
                Button {
                    if (isFromcode == true){
                        (codeValueFrom = currency.code)
                    }else{
                        (codeValueTo = currency.code)
                    }
                    isPresented = false
                } label: {
                    CurrencyCell(currency: currency)
                    
                }
            }
        }
        .navigationTitle("Currency Code")
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static let modelData = CurrencyModelData()
    static var previews: some View {
        CurrencyList(isPresented: .constant(true), codeValueFrom: .constant("USD"), codeValueTo: .constant("GBP"), isFromcode: .constant(true))
            .environmentObject(modelData)
    }
}
