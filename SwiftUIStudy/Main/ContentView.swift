//
//  ContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Base"), content: { //section의 헤더에 헤더 이름을 써주고 컨텐트안에 묶는다.
                    NavigationLink(destination: Text("basic")) {
                        Text("기본 네비게이션링크")
                    }
                    NavigationLink(destination: CountingButton()) {
                        Text("CountingButton")
                    }
                    NavigationLink(destination: AlertView()) {
                        Text("Alert")
                    }
                    NavigationLink(destination: TextFieldView()) {
                        Text("TextField")
                    }
                })
            }
            .navigationBarTitle("List")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
