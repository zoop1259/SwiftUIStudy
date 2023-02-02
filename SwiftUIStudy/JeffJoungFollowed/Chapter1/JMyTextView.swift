//
//  JMyTextView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/31.
//

import SwiftUI

struct JMyTextView: View {
    
    //똑같이 데이터 연동
    //데이터를 연동시키기 위해 Binding사용
    @Binding var JisActivated: Bool
    
    //생성자를 사용해야 한다. 그럼 아래 Previews에 기본값을 넣어주지 않아도 된다.
    init(JisActivated: Binding<Bool> =
        .constant(true)) {
            _JisActivated = JisActivated
        }
    
    //인덱스값을 받아오기위해.
    @State private var index: Int = 0
    
    //배경색 배열
    private let backgroundColors = [
        Color.red,
        Color.yellow,
        Color.blue,
        Color.green,
        Color.orange
    ]
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("배경 아이템 인덱스 \(self.index)")
                .font(.system(size: 30))
                .fontWeight(.bold)
            //1. 여기 뒤에 .ignoresSafeArea() 붙이는것과
            //https://babbab2.tistory.com/163 이 글을 보면 Spacer()의 safearea 관련 된 글을 볼 수 있다.
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100) //.ignoresSafeArea()
            Text("활성화 상태: \(String(JisActivated))")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(self.JisActivated ? Color.yellow : Color.gray)
                .background(Color.black)
            
            Spacer()
        }
        .background(backgroundColors[index])
        //2. 아래와는 어떻게 다른가.
        //https://stackoverflow.com/questions/60676722/how-can-i-use-edgesignoringsafearea-in-swiftui-but-make-a-child-view-respect-th
        //여기서 보니 아래는 더이상 사용되지 않는다고 되어있다.
        //.edgesIgnoringSafeArea(.all)
        .onTapGesture {
            print("배경 인텍스가 클릭되었다.")
            
            if(self.index == self.backgroundColors.count - 1) {
                self.index = 0
            } else {
                self.index += 1
            }
        }
        
    }
}

struct JMyTextView_Previews: PreviewProvider {
    static var previews: some View {
        JMyTextView()
    }
}
