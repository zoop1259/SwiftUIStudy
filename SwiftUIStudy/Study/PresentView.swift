//
//  PresentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/01.
//

import SwiftUI

struct PresentView: View {
    @State private var isPresented = false
    @State private var toggles = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            Button("Show Popover") {
                isPresented.toggle()
            }
            if isPresented {
                GeometryReader { geometry in
                    VStack {
                        Text("Popover Content")
                            .font(.headline)
                        Toggle("Option 1", isOn: .constant(false))
                        Toggle("Option 2", isOn: .constant(false))
                        Toggle("토글도 먹히나?", isOn: $toggles)
                        Spacer()
                    }
                    .padding()
                    .frame(width: min(geometry.size.width, 200), height: min(geometry.size.height, 200))
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .position(x: geometry.frame(in: .global).midX, y: geometry.frame(in: .global).midY)
                }
                .background(Color.black.opacity(0.4))
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    isPresented = false
                }
            }
        }
    }
}

struct PresentView_Previews: PreviewProvider {
    static var previews: some View {
        PresentView()
    }
}
