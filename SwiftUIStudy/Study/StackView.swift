//
//  StackView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/28.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //Text("이렇게하면 미리보기화면은 두개로 나뉘어진다.")
        
        //Vstack도 10개의 자식을 가질 수 있다. 그 이상을 추가하려면 group으로 묶어라.
        //그러므로 VStack은 하위 보기 수가 적을 때 사용하는것이 이상적이다.
        //더 많은경우 LazyVStack같은것을 사용하거나 form등을 사용하는것이 좋다.
        VStack(spacing: 20) { //Spacing을 여기서 사용하면 내부의 각 컴포넌트마다 자동으로 spacing된다.
            Text("CMD 클릭을 통해 스택으로 묶어보자")
            Text("그럼 자동으로 Text는 스택안에 감싸진다.")
            
            HStack(spacing: 20) { //좌우간격 늘리기
                Text("Hello, world!")
                Text("This is inside a stack")
            }
            
            VStack {
                Spacer() //두번쨰로 이걸 추가하면 아래 컴포넌트들이 중앙정렬된다.
                Text("First")
                Text("Second")
                Text("Third")
                Spacer() //이거만 추가해도 나머지 스택뷰를 위로 올려버린다.
                Spacer() //세번쨰로 이걸 추가하면 컴포넌트들이 살짝 위로 올라간다.
            }
            
            ZStack { //위로 쌓이는 stack이라 텍스트라면 보기 힘들어진다.
                Text("Hello, world!")
                Text("This is inside a stack")
            }
        }
        

    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
