//
//  JTapView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI

struct JTapView: View {
    var body: some View {
        TabView{
            JTabViewColor(title: "1번", bgColor: .purple)
                .tabItem {
                    Image(systemName: "airplane")
                }
                .tag(0)
                

            Text("2번")
                .tabItem {
                    Image(systemName: "flame.fill")
                }
                .tag(1)

            Text("3번")
                .tabItem {
                    Image(systemName: "doc.fill")
                    Text("doc")
                }
                .tag(2)
        }
    }
}

struct JTapView_Previews: PreviewProvider {
    static var previews: some View {
        JTapView()
    }
}
