//
//  MVVMTextFieldView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/29.
//

import SwiftUI
import Combine

struct MVVMTFV: View {
    @ObservedObject var viewModel: MVVMVM
    @State var text: String = ""
    
    var body: some View {
        VStack {
            TextField("데이터 입력: ", text: $viewModel.data.text, onEditingChanged: { inputText in //2. 이 클로저는 지워도 된다.
                print("입력됨 \(inputText)") //1. 이걸 쓰지않는다면
                self.viewModel.data.text = self.text
            })
                .padding()
            
            Text("입력된 데이터: \(text)")
                .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

/* 이렇게하면 Text는 입력된데이터가 입력될떄마다 변경되는걸 감지하지 못한다.
 이유는 TFV에서 텍스트필드에 입력한 텍스트는 VM의 data객체의 text 프로퍼티에 할당되지만,
 TFV의 Text뷰는 VM의 data객체의 text프로퍼티를 참조하지 않고, 별도의 text프로퍼티를 가지고 있기 때문
 
 
 struct MVVMTFV: View {
     @ObservedObject var viewModel: MVVMVM
     var body: some View {
         VStack {
             TextField("데이터 입력: ", text: $viewModel.data.text)
                 .padding()
             
             Text("입력된 데이터: \(viewModel.data.text)")
                 .padding()
         }
     }
 }
 */
