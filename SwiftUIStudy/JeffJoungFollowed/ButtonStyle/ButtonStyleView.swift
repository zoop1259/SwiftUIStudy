//
//  ButtonStyleView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/15.
//

import SwiftUI

struct ButtonStyleView: View {
    var body: some View {
        Button("탭") {
            print("버튼 클릭됨.")
        }
    }
}

struct ButtonStyleView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStyleView()
    }
}
