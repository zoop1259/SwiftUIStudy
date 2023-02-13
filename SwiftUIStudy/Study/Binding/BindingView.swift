//
//  BindingView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/13.
//

import SwiftUI

struct BindingView: View {
  @Binding var receiveTextBind: String //변수명을 일치시켜야하는것인가.. 는 아니였고 입력하는 View에서 받을 값이다. 라고 생각하면 좋다.
  //@State private var bindingViewTextField = ""
    var body: some View {
      NavigationView {
        VStack {
          Text(receiveTextBind)
          
          TextField("여기서도 입력해도 바뀌려나?", text: $receiveTextBind) //바뀌지 않는다. 왜냐하면 값을 넘겨주지 않고, StateView에선 값을 받지 않으니까.
          
          NavigationLink(destination: StateView()) {
            Text("StateView로...")
          }
        }
      }
    }
}

//struct BindingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BindingView()
//    }
//}
