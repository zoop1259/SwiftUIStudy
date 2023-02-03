//
//  JTabViewColor.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI

struct JTabViewColor: View {
    
    var title: String
    var bgColor: Color
    
    var body: some View {
        ZStack {
            
            bgColor
                .edgesIgnoringSafeArea([.top,.leading,.trailing]) //이렇게 안하면 탭바까지 칠해짐...
            
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct JTabViewColor_Previews: PreviewProvider {
    static var previews: some View {
        JTabViewColor(title: "프리뷰", bgColor: .purple)
    }
}
