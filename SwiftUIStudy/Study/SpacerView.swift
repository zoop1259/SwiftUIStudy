//
//  SpacerView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/07.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        VStack {
            Button("Top Button") {
                // 버튼 액션
            }
            Spacer()
            Button("Bottom Button") {
                // 버튼 액션
            }
        }
    }
}

struct SpacerView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerView()
    }
}
