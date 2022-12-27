//
//  CountingButton.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct CountingButton: View {
    @State var tapCount = 0 //State를 사용해주어야한다.
    
    var body: some View {
        Button("탭한 횟수 : \(tapCount)") {
            //액션을 적어주면 됨
            self.tapCount += 1
        }
        .navigationTitle("TapTap")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /* 이렇게하면 NavigationView안에 또 NavigationView로 감싸기떄문에 UI가 또 그려짐... navigationView없이 쓰면된다.
    var body: some View {
        NavigationView {
            Button("탭한 횟수 : \(tapCount)") {
                //액션을 적어주면 됨
                self.tapCount += 1
            }
            .navigationTitle("TapTap")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    */
}

struct CountingButton_Previews: PreviewProvider {
    static var previews: some View {
        CountingButton()
    }
}
