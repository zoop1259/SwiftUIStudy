//
//  ToggleView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/17.
//

import SwiftUI

struct ToggleView: View {
  @State private var toggle: Bool = false
  @State private var text: String = ""
  @State private var onChangeText: String = "Toggle 기다림."
  
  var body: some View {
      VStack {
        
        Toggle("토글이다아", isOn: $toggle)
        
        Button("토글 활성 여부") {
            if toggle {
              print("toggle on")
              text = "토글 on"
            } else {
              print("toggle off")
              text = text + "토글 off" //이런식으로하면 초깃값에 계속 더해지게 된다.
            }
        }
        
        Text("이건 버튼에 의해 나타나는 Text: " + text)
        
        Text(onChangeText)
        
      }
      .onChange(of: toggle) { newValue in
        onChangeText = newValue ? "이건 onChnage로 인한 Text on" : "이건 onChange로 인한 Text off"
      }
    }
}

struct ToggleView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleView()
    }
}
