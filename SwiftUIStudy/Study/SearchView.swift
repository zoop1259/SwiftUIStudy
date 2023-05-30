//
//  SearchView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/22.
//

import SwiftUI

class UserData: ObservableObject {
    @Published var text: String = ""
}

struct SearchView: View {
    @ObservedObject var userData = UserData()
    @State private var placeholder: String = "Enter text here"

    @State private var searchText = ""
    let data: [String: Int] = ["A" : 1, "B" : 2, "C" : 3]
    var filterData: [String: Int] {
        if searchText.isEmpty {
            return data
        } else {
            return data.filter { $0.key.contains(searchText) }
        }
        
    }
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(filterData.sorted(by: <), id: \.key) { key, value in
                    Text("\(key): \(value)")
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("BasicSearch")
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
