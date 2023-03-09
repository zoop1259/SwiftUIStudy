//
//  SheetView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/27.
//

import SwiftUI

//sheet위에 sheet 
struct SheetView: View {
    @State private var showingFirst = false
    @State private var showingSecond = false

    var body: some View {
        VStack {
            Button("Show First Sheet") {
                showingFirst = true
            }
        }
        .sheet(isPresented: $showingFirst) {
            Button("Show Second Sheet") {
                showingSecond = true
            }
            .sheet(isPresented: $showingSecond) {
                Text("Second Sheet")
            }
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
