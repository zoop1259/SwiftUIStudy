//
//  MenuMainView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/03.
//

import SwiftUI

struct MenuMainView: View {
    @State private var isMenuOpen = false

    var body: some View {
        VStack {
            Button(action: { self.isMenuOpen.toggle() }) {
                Text("Show menu")
            }
            .padding()
            
            if isMenuOpen {
                Menu {
                    Button("Item 1") {}
                    Button("Item 2") {}
                    Button("Item 3") {}
                } label: {
                    HStack {
                        Text("Menu")
                        Spacer()
                        Image(systemName: "checkmark")
                    }
                }
                .menuStyle(BorderlessButtonMenuStyle())
                .onChange(of: isMenuOpen) { value in
                    if !value {
                        self.isMenuOpen = false
                    }
                }
            }
        }
    }
}
struct MenuMainView_Previews: PreviewProvider {
    static var previews: some View {
        MenuMainView()
    }
}
