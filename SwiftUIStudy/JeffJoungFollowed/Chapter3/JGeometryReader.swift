//
//  JGeometryReader.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI

struct JGeometryReader: View {
    @State private var mul1 = false
    @State private var mul2 = false
    @State private var mul3 = false
    
    var body: some View {
        
        //지오매트리리더를 사용하는 이유는. 모든 기종의 크기가 다 다르기 때문에 Scrollview같은것을 사용하지 않을떄는 사용해주어야한다.
        GeometryReader { geometryReader in
            HStack(spacing: 0) {                
                Button {
                    withAnimation {
                        mul1.toggle()
                    }
                } label: {
                    Text("!")
                        .font(.system(.largeTitle, design: .rounded, weight: .black))
                        .foregroundColor(.white)
                        .frame(width: geometryReader.size.width / 3, height: mul1 ? geometryReader.size.height / 2 : geometryReader.size.height / 4)
                        .background(Color.red)
                }

                Button {
                    withAnimation {
                        mul2.toggle()
                    }
                } label: {
                    Text("2")
                        .font(.system(.largeTitle, design: .rounded, weight: .black))
                        .foregroundColor(.white)
                        .frame(width: geometryReader.size.width / 3, height: mul2 ? geometryReader.size.height / 2 : geometryReader.size.height / 4)
                        .background(Color.blue)
                }
                Button {
                    withAnimation {
                        mul3.toggle()
                    }
                } label: {
                    Text("3")
                        .font(.system(.largeTitle, design: .rounded, weight: .black))
                        .foregroundColor(.white)
                        .frame(width: geometryReader.size.width / 3, height: mul3 ? geometryReader.size.height / 2 : geometryReader.size.height / 4)
                        .background(Color.green)
                }

            }.position(x: geometryReader.size.width / 2 ,y: geometryReader.size.height / 2)
        }.background(.black)
    }
}

struct JGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        JGeometryReader()
    }
}
