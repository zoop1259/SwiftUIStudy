//
//  StateView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/13.
//

import SwiftUI

struct StateView: View {
  @State private var sendTextBind: String = ""
  
    var body: some View {
      NavigationView {
        VStack {
          TextField("여긴 입력도 하지만 입력도 받는다.", text: $sendTextBind)
          
          Text(sendTextBind)
          
          //만약 넘어갈 화면에서 Binding이 있다면 그 값(Binding변수)에 보내줄 내 값을 정해줘야한다.
          NavigationLink(destination: BindingView(receiveTextBind: $sendTextBind)) {
            Text("바인딩뷰로...")
          }
        }
      }
    }
}

struct StateView_Previews: PreviewProvider {
    static var previews: some View {
        StateView()
    }
}
