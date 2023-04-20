//
//  CurrencyConverter.swift
//  ForexSDK
//
//  Created by Ranu Dhurandhar on 18/04/23.
//

import SwiftUI

struct CurrencyConverterView: View {
    
    @ObservedObject var viewModel: CurrencyConverterViewModel
    @State private var itemSelected = 0
    @State private var itemSelected2 = 1
    @State private var amount : String = ""
    private let currencies = ["USD", "EUR", "GBP"]
    @FocusState private var focusedField: Field?
    private enum Field: Int, CaseIterable {
        case amount
        case str
    }
    
    func convert() {
        let from =  currencies[itemSelected]
        let to = currencies[itemSelected2]
        if !amount.isEmpty{
            viewModel.convertCurrency(
                request: CurrencyConverterRequest(
                    to: to,
                    from: from,
                    amount: amount)
            )
        }
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
                                .focused($focusedField, equals: .amount)
                                .toolbar {
                                    ToolbarItem(placement: .keyboard) {
                                        Button("Done") {
                                            focusedField = nil
                                            convert()
                                        }
                                    }
                                }
                            Spacer()
                            Picker(selection: $itemSelected, label: Text("")){
                                ForEach(0 ..< currencies.count, id: \.self){ index in
                                    Text(self.currencies[index]).tag(index)
                                }
                            }
                            .onChange(of: itemSelected) { newValue in
                                convert()
                            }
                        }
                        
                    }
                    Image(uiImage: UIImage(named: "exchangeCurrency") ?? UIImage()  )
                        .resizable()
                        .frame(width: 32.0, height: 32.0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack(alignment: .leading){
                        Text("To")
                        HStack{
                            Text(viewModel.currencyConverter?.result.rounded(digits: 2).removeZerosFromEnd() ?? "0")
                            Spacer()
                            Picker(selection: $itemSelected2, label: Text("")){
                                ForEach(0 ..< currencies.count, id: \.self){ index in
                                    Text(self.currencies[index]).tag(index)
                                }
                            }
                            .onChange(of: itemSelected2) { newValue in
                                convert()
                            }
                        }
                        .foregroundColor(.blue)
                    }
                }.listRowSeparatorTint(.white)
            }
        }
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView(viewModel: CurrencyConverterViewModel(currencyConverterService: CurrencyConverterService()))
    }
}
