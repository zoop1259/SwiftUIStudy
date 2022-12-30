//
//  ColorAndFrameView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/28.
//

import SwiftUI

struct ColorAndFrameView: View {
    var body: some View {
        ZStack {
            VStack { //반반 나뉜 색을 추가된다.
                Color.red
                Color.blue
            }
            //1. 아래방법을 사용하면 FaceID가 있는 iphone13등과 같은 상태표시줄과 홈표시기가 무채색으로 남는다.
            //Color.red //Stack의 모든범위에 색을 칠하고, red이런식으로 색을 한번에 지정해줄수도있다.
            Color(red: 1, green: 0.8, blue: 0) //이렇게 rgb값을 넣어줄수도있다.
                //.frame(width: 200, height: 200) //기본적으로 크기를 정해줄수 있으나...
            //이렇게 최소너비와 맥스너비를 정해줄수있다.
                .frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
            Text("Your content")
                //.background(.red) //백그라운드 설정.
            //아래 foreground의 효과를 다루는걸 vibrancy라고 부른다.
//                .foregroundColor(.secondary)
                .foregroundStyle(.red) //글씨색을 바꿀수있다.
                .padding(50)
                .background(.ultraThinMaterial) //유리효과를 사용할 수 있다.
        }
        .ignoresSafeArea()  //2.그래서 이걸 사용해주면 모두 덮는다.
    }
}

struct ColorAndFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ColorAndFrameView()
    }
}
