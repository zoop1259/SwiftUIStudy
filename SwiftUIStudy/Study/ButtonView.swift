//
//  ButtonView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/01.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        VStack(spacing: 15) {
            Button {
                print("이런식으로 액션을 직접 설정할 수 있다.")
            } label: {
                Text("Tap Button")
                    .padding()
                    .foregroundColor(.white)
                    .background(.red)
                
            }
            Button("이렇게 바로 라벨을 적어줘도 된다.", role: .destructive ,action: funcCalled)
            Button("bordered Button") { }
                .buttonStyle(.bordered)
                .tint(.mint)
            Button("bordered + destructive Button", role: .destructive) { }
                .buttonStyle(.bordered)
            Button("borderedProminent Button") { }
                .buttonStyle(.borderedProminent)
            Button("borderedProminent + borderedProminent Button ", role: .destructive) { }
                .buttonStyle(.borderedProminent)
            
            Button {
                print("연필 버튼 누름")
            } label: {
                Image(systemName: "pencil")
            }
            Button {
                print("연필 라벨 버튼 누름")
            } label: {
                Label("Label을 사용하여 타이틀과 이미지 설정 가능하다.", systemImage: "pencil")
            }
            
            Button {
                print("연필 버튼 누름")
            } label: {
//                Image("pencil") //이건 에셋에 이미지가 있어야한다.
                Image(decorative: "pencil") //동일한 이미지를 로드하지만 스크린 리더를 활성한 사용자를 위해 읽어주지 않는다?
            }
            
            
        }
    }
    func funcCalled() {
        print("이렇게 함수를 설정하고 불러올 수 있다.")
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
