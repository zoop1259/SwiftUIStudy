//
//  SwiftUIStudyApp.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

@main //이 앱의 시작점이 된다는 것을 가리킨다.
struct SwiftUIStudyApp: App { //구조체는 App프로토콜을 준수하며 앱의 콘텐츠와 동작을 제공한다
    //body는 요구 사항인 계산된 속성을 구현한다.
    //Scene는 설명된 앱의 콘텐츠를 반환한다. 에는 앱의 사용자 인터페이스를 정의하는 뷰 계층 구조가 포함되어 있다. SwiftUI는 WindowGroupWindowDocumentGroupSettings및 다양한 유형의 장면제공
    var body: some Scene {
        WindowGroup {       //장면을 사용하여 앱이 표시하는 기본창을 나타낸다. 얘를들어 macOS나 iPadOS는 한사람이 그룹에서 둘 이상의 창을 열 수 있다.
            ContentView()   //macOS에서는 창 그룹의 여러 인스턴스를 탭 세트로 결합할 수 있다. 일단 첫화면은 ContentView이다.
        }
    }
}
