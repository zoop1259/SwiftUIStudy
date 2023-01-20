//
//  IF삼항연산자.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/17.
//

import SwiftUI
//엥 ㅋㅋ 스유에선 _____로 되는구나
struct IF______________: View {
    @State private var useRedText = false
    
        var body: some View {
            ZStack {
                
                VStack(spacing: 20) {
                    Button("삼항연산자") {
                        //애니메이션효과와 함께
                        withAnimation {
                            //버튼이 토글되면 실행
                            self.useRedText.toggle()
                        }
                    }
                    
                    Button("UIKit과는 다른 IF문") {
    //                    if true {
    //                        Text("if 구문은 오류.")
    //                    } else {
    //                        Text("안됨")
    //                    }
                        
                        if true {
                            return useRedText.toggle()
                        } else {
                            return useRedText.toggle()
                        }
                    }
                }

                .font(.largeTitle)
                .foregroundColor(.black)
                //배경색을 채워줌
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                //useRedText가 true이면 yellow, false이면 green
                .background(useRedText ? Color.yellow : Color.green)
                //safeArea 부분까지 채워줌
                .edgesIgnoringSafeArea(.all)
            }
        }
}

struct IF_______________Previews: PreviewProvider {
    static var previews: some View {
        IF______________()
    }
}
