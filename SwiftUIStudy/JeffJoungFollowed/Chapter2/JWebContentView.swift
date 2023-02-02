//
//  JWebContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI

struct JWebContentView: View {
    var body: some View {
        //JMyWebview(urlToLoad: "https://www.naver.com")
        
        //NavigationView {
            HStack {
                NavigationLink(destination: JMyWebview(urlToLoad: "https://www.naver.com")
                    .edgesIgnoringSafeArea(.all)
                ) {
                    Text("네이버")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.green)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: JMyWebview(urlToLoad: "https://www.daum.net")) {
                    Text("다음")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
                NavigationLink(destination: JMyWebview(urlToLoad: "https://www.google.com")) {
                    Text("구글")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(20)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)
                }
            }
            .navigationBarTitle("WebView")
            .navigationBarTitleDisplayMode(.inline)
        //}
        
    }
}

struct JWebContentView_Previews: PreviewProvider {
    static var previews: some View {
        JWebContentView()
    }
}
