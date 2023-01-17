//
//  CustomContainerView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/12.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
//    let content: (Int, Int) -> Content //1
    @ViewBuilder let content: (Int, Int) -> Content //2
    
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.blue)
                .padding()
                .background(Color.green)
                .padding()
                .background(Color.yellow)
                .padding()
                .background(Color.black)

            Button("Hello World") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(Color.red)

            VStack(spacing: 10) {
                CapsuleText(text: "First")
                    .foregroundColor(.white)
                CapsuleText(text: "Second")
                    .foregroundColor(.yellow)
            }
            
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct CustomContainerView: View {
    var body: some View {
        
        //1
//        GridStack(rows: 4, columns: 4) { row, col in
//            HStack {
//                Image(systemName: "\(row * 4 + col).circle")
//                Text("R\(row) C\(col)")
//            }
//        }
        
        //2
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct CustomContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainerView()
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .clipShape(Capsule())
    }
}
