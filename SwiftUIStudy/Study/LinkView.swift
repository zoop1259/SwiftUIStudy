//
//  LinkView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/12.
//

import SwiftUI

struct LinkView: View {
    var body: some View {
        VStack {
            Link(destination: URL(string: "https://www.naver.com")!) {
                Text("Go to Example Website")
            }
        }
    }
}
struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView()
    }
}
