//
//  SheetView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/01.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        VStack {
            Text("This is a modal view")
                .padding()
            Toggle("Toggle", isOn: .constant(true))
                .padding()
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView()
    }
}
