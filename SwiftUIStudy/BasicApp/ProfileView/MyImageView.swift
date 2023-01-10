//
//  MyImageView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

struct MyImageView: View {
    var body: some View {
        Image("MyImage")
            .resizable() //큰 이미지 맞춰주기
            .frame(width: 250, height: 250) //크기 조절해줘야함.
            .clipShape(Circle()) // 원형의 클리핑모양 사용
            .overlay {
                Circle().stroke(.white, lineWidth: 4 ) //하얀선의 오버레이 그려줌.
            }
            .shadow(radius: 7) //그림자 그려줌.
    }
}

struct MyImageView_Previews: PreviewProvider {
    static var previews: some View {
        MyImageView()
    }
}
