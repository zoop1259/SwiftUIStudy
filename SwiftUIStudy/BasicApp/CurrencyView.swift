//
//  CurrencyView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct CurrencyView: View {
    @State private var checkAmount = 0.0 //수표 비용.
    @State private var numberOfPeople = 2 //분담 인원
    @State private var tipPercentage = 20 //남겨야할 팁
    @FocusState private var amountIsFocused: Bool //키보드 내리기 위한 포커스
    let tipPercentages = [10, 15, 20, 25, 0] //세그먼트에 추가될 퍼센트.

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var body: some View {
        Form {
            Section(header: Text("통화"), content: {
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "EUR"))
                    .keyboardType(.decimalPad)
                
                
                TextField("OldCodeAmount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            })

            Section(header: Text("분담 인원"), content: {
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
            })
            
            Section {
                Picker("Tip", selection: $tipPercentage) {
                    ForEach(tipPercentages, id: \.self) {
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented) //이렇게하면 세먼트 스타일로 변경된다.
            } header: {
                Text("이런식으로도 섹션의 헤더를 추가할 수 있다.")
            }
            
            Section(header: Text("결과"), content: {
                Text(totalPerPerson, format: .currency(code: Locale.current.currencyCode ?? "USD"))
            })
            .navigationTitle("Split")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        //.navigationBarTitle("")
        //.navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CurrencyView_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyView()
    }
}
