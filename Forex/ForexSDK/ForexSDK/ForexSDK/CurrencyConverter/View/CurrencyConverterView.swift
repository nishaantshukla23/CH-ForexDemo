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
    @State var isShowSheet = false
    @State var isFromCode = false
    @State var codeValueFrom: String = "USD"
    @State var codeValueTo: String = "EUR"
    @FocusState private var focusedField: Field?
    private enum Field: Int, CaseIterable {
        case amount
        case str
    }
    
    func convert() {
        let from =  codeValueFrom
        let to = codeValueTo
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
        VStack {
            VStack(alignment: .center) {
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
                        Button {
                            self.isShowSheet = true
                            self.isFromCode = true
                        } label: {
                            Text(codeValueFrom)
                                .padding()
                        }
                    }
                }
                Image(uiImage: UIImage(named: "exchangeCurrency") ?? UIImage())
                    .resizable()
                    .frame(width: 32.0, height: 32.0)
                    .frame(maxWidth: .infinity, alignment: .center)
                VStack(alignment: .leading){
                    HStack{
                        Text(viewModel.currencyConverter?.result.rounded(digits: 2).removeZerosFromEnd() ?? "0")
                        Spacer()
                        Button{
                            self.isShowSheet = true
                            self.isFromCode = false
                        } label: {
                            Text(codeValueTo)
                                .padding()
                        }
                        .sheet(isPresented: $isShowSheet, onDismiss: {
                            if !isShowSheet {
                                convert()
                            }
                        }) {
                            CurrencyList(isPresented: $isShowSheet, codeValueFrom: $codeValueFrom, codeValueTo: $codeValueTo, isFromcode: $isFromCode)
                                .environmentObject(CurrencyModelData())
                        }
                    }
                }
            }
            .padding(.all, 10.0)
            .background(Color.white)
            .cornerRadius(8.0)
            .shadow(color: Color.gray.opacity(0.3), radius: 2.0)
        }
        .padding(.all, 10.0)
        Spacer()
            .navigationTitle("Currency Converter")
            .navigationBarTitleDisplayMode(.large)
    }
}

struct CurrencyConverterView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyConverterView(viewModel: CurrencyConverterViewModel(currencyConverterService: CurrencyConverterService()))
    }
}
