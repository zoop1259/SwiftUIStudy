//
//  PopoverMainView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/02.
//

import SwiftUI

struct PopoverMainView: View {
    @State private var isPresented = false

    var body: some View {
        ZStack {
            Color.green
            VStack {
                Button("Show Subview") {
                    isPresented = true
                }
                .padding()
            }
            .popover(isPresented: $isPresented, arrowEdge: .leading) {
                PopoverView()
                    .frame(width: 200, height: 100)
            }
        }
    }
}

struct PopoverMainView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverMainView()
    }
}
