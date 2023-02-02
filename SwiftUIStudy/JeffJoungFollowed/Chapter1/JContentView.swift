//
//  JContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/31.
//

import SwiftUI

struct JContentView: View {
    
    //state가 없으면 Cannot use mutating member on immutable value: 'self' is immutable 에러 발생
    @State private var JisActivated: Bool = false
    
    var body: some View {
        //NavigationView {
            VStack {
                HStack {
                    JMyVstackView(JisActivated: $JisActivated)
                    JMyVstackView(JisActivated: $JisActivated)
                    JMyVstackView(JisActivated: $JisActivated)
                    
                } //HStack
                .padding(JisActivated ? 50 : 10) //안쪽으로 집어넣는다는 느낌이다.
                //.padding(.top, 30) //탑에만 30을 주겠다.
                .background(JisActivated ? Color.yellow : Color.black)
                //탭 제스처 추가.
                .onTapGesture {
                    print("HStack이 클릭되었다.")
                    //애니메이션 추가.
                    withAnimation {
                        self.JisActivated.toggle() //알아서 false true 값이 변경됨.
                    }
                }
                //네비게이션 뷰로 묶지않으면 Preview에선 링크를 사용할 수 없으나. ContentView를 통하면 정상적으로 작동한다.
                //그러나 강의 따라가기 위해 우선 NavigationView를 그냥 사용한다.
                NavigationLink(destination: JMyTextView(JisActivated: $JisActivated)) {
                    Text("네비게이션")
                        .font(.title)
                        .fontWeight(.heavy)
                }
                .padding(20)
            }
        //}
        .navigationBarTitle("J따라하기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct JContentView_Previews: PreviewProvider {
    static var previews: some View {
        JContentView()
    }
}
