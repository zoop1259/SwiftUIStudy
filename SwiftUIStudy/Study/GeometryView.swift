//
//  GeometryView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/12/08.
//

import SwiftUI

struct GeometryView: View {
    var body: some View {
        //순서 중요 또 중요.
        GeometryReader { geometry in
            Color.yellow // 배경색을 설정
            VStack() {
                Text("ㅇㅇ")
                    .baselineOffset(0)
            }
            
            .background(.blue)
            .frame(width: geometry.size.width * 0.7, height: geometry.size.height * 0.7)
            //이것은 아이폰의 다크모드에는 또 다른 색으로 될 수 있기 때문에 추천하지 않는다고 한다.
            .background(.thinMaterial)
            //RGB방식.
            .background(Color(red: 0, green: 1, blue: 1))
            //.background(.lightGray) //이것은 왜 되지 않는가.
            //Type 'ShapeStyle' has no member 'lightGray' 미리 정의된 색상에 없기 때문이다.
            //그래서 Color에다가 UIColor를 사용해주어야한다.
            //.background(Color(UIColor.lightGray))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
    }
}

struct GeometryView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryView()
    }
}
