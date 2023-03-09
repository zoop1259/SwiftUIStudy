//
//  PopoverView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/02.
//

import SwiftUI

/*
 https://developer.apple.com/design/human-interface-guidelines/components/presentation/popovers/
 */

/**
 PopoverView의 기본 사용법
 
 >
 - 주의할 점
    - 공식문서에서는 안내문구를 제외하고 다른 View를 사용하지 아니하라고 되어있음. 괜히 사용했다간 나중에 리젝당한다.
 
 */
struct PopoverView: View {
    @State private var isOn = true
    
    var body: some View {
        VStack {
            Text("Sub View")
                .font(.title)
            Toggle("Toggle", isOn: $isOn)
                .padding(5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.gray, lineWidth: 2)
        )
        .padding(10)

    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}
