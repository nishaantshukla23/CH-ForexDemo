//
//  CurrencyConverter.swift
//  ForexSDK
//
//  Created by Ranu Dhurandhar on 18/04/23.
//

import SwiftUI

struct CurrencyConverterView: View {
    
    @State private var amount : String = ""
    @State var isShowSheet = false
    @State var isFromCode = false
    @State var codeValueFrom: String = "USD"
    @State var codeValueTo: String = "EUR"
    func convert(_ convert: String) -> String {
        var conversion: Double = 1.0
        let amount = Double(convert.doubleValue)
        let selectedCurrency =  codeValueFrom
        let to = codeValueTo
        let euroRates = ["USD": 1.15, "EUR": 1.0, "GBP": 0.84]
        let usdRates = ["USD": 1.0, "EUR": 0.87, "GBP": 0.73]
        let gbpRates = ["USD": 1.37, "EUR": 1.18, "GBP": 1.0]
        
        switch(selectedCurrency){
        case "USD" :
            conversion =  amount * (usdRates[to] ?? 0.0)
        case "EUR" :
            conversion =  amount * (euroRates[to] ?? 0.0)
        case "GBP" :
            conversion =  amount * (gbpRates[to] ?? 0.0)
        default:
            print("Something went wrong")
        }
        return String(format: "%.2f", conversion)
        
    }
    
     var body: some View{
        NavigationView{
            List {
                Section(header: Text("Convert a currency")){
                    VStack(alignment: .leading){
                        Text("From")
                        HStack{
                            TextField("Enter an amount", text: $amount)
                                .keyboardType(.decimalPad)
                            Button {
                                    self.isShowSheet = true
                                    self.isFromCode = true
                            } label: {
                                Text(codeValueFrom)
                                .padding()
                             }
                         }
                    }
                    .sheet(isPresented: $isShowSheet) {
                        CurrencyList(isPresented: $isShowSheet, codeValueFrom: $codeValueFrom, codeValueTo: $codeValueTo, isFromcode: $isFromCode)
                    }
                    Image(uiImage: UIImage(named: "exchangeCurrency")!)
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .leading){
                        Text("To")
                        HStack{
                            Text("\(convert(amount))")
                            Spacer()
                            Button{
                                self.isShowSheet = true
                                self.isFromCode = false
                            } label: {
                                Text(codeValueTo)
                                .padding()
                            }
                           
                        }
                        
                    }
                    .sheet(isPresented: $isShowSheet) {
                        CurrencyList(isPresented: $isShowSheet, codeValueFrom: $codeValueFrom, codeValueTo: $codeValueTo, isFromcode: $isFromCode)
                            .environmentObject(CurrencyModelData())
                    }
                }.listRowSeparatorTint(.white)
            }
            
        }
        
    }
    
    struct CurrencyConverterView_Previews: PreviewProvider {
        static var previews: some View {
            CurrencyConverterView()
                
        }
    }
}
