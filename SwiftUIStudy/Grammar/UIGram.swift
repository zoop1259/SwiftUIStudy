//
//  UIGram.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/02.
//

import SwiftUI

struct UIGram: View {
    
    //@State는 SwiftUI는 var만으로 값을 변경 할 수 없다. 앱 화면을 다시 그려주기 위해 사용.
    @State var name : String
    
    //some은 불투명한 타입(Opaque Types)에 해당한다. 
    var body: some View {
        
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


/*
 네비게이션 뷰와 탭 뷰를 함께 사용하는 형식은 2가지가 있다.
 1. 탭뷰 내부에 네비게이션 뷰 이용하기
 2. 네비게이션 뷰 내부에 탭뷰 이용하기

 1번 이슈와 솔루션
 1번의 문제점은 화면 전환 시 탭바가 사라지지 않는다는 것이다. 이걸 해결하기 위해 구글링해보면 2번처럼 이용하라는 답을 많이 얻게된다. 그래서 나도 2번처럼 이용했다.

 2번 이슈와 솔루션
 탭바가 사라지는건 정상적으로 되는데, Navigation Bar가 Hidden되지 않는 문제가 생긴다. 엄청 시간을 들여서 찾은 솔루션은, 각 Tab이 Appear될 때마다 navigation title을 변경해주는 것이다. 원인은 모르겠지만 이렇게 하면 정상적으로 Navigation bar가 사라진다.
 */
