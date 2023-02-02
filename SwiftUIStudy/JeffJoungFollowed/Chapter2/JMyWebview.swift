//
//  JMyWebview.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI
import WebKit

//                  UIKit의 UIView를 사용할 수 있게 해준다.
//                  UIViewControllerRepresentable을 사용하는것.
struct JMyWebview: UIViewRepresentable {
    
    var urlToLoad: String
    
    //ui view 만들기
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        
        return webView
    }
    //업데이트 ui view
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<JMyWebview>) {
        
    }
    
    
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        JMyWebview(urlToLoad: "https://www.naver.com")
    }
}
