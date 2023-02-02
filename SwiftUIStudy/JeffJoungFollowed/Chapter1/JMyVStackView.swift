//
//  JMyVStackView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/31.
//

import SwiftUI

struct JMyVstackView: View {
    
    //데이터를 연동시키기 위해 Binding사용
    @Binding var JisActivated: Bool
    
    //생성자를 사용해야 한다. 그럼 아래 Previews에 기본값을 넣어주지 않아도 된다.
    init(JisActivated: Binding<Bool> =
        .constant(true)) {
            _JisActivated = JisActivated
        }
    
    var body: some View {
        VStack {
            Text("1!")
                .font(.system(size: 60))
            Text("2!")
                .font(.system(size: 60))
            Text("3!")
                .font(.system(size: 60))
        } //VStack
        .background(self.JisActivated ? Color.green : Color.red)
        .padding(self.JisActivated ? 10 : 0 )
    }
}

struct JMyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        JMyVstackView()
    }
}
