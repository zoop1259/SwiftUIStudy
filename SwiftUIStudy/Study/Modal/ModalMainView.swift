//
//  SheetMainView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/01.
//

import SwiftUI

struct ModalMainView: View {
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            Color.black
            VStack {
                Button("Show Modal") {
                    showModal.toggle()
                }
            }
            .sheet(isPresented: $showModal, content: {
                ModalView()
                    .frame(width: 200, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
            })
        }
    }
}

struct ModalMainView_Previews: PreviewProvider {
    static var previews: some View {
        ModalMainView()
    }
}
