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

    var body: some View {
        VStack {
            TextField(placeholder, text: $userData.text)
            Text("Text is: \(userData.text)")
        }
    }
}
