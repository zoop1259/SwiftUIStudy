//
//  EnumSetting.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/11.
//

//
import SwiftUI

//hashable을 사용하면 dictionary나 set같은 컬렉션에서 탐색이 가능해짐, CaseIterable을 사용하면 loop를 할 수 있음, 식별 가능한 프로토콜에도 부합하는지 확인하기 위해 Identifiable사용 그리고 View를 채택하여 body부분을 구현한다.
enum EnumSetting: String, Hashable, CaseIterable, Identifiable, View {
    //옵션 쉬프트 드래그하면 다중커서 가능
    case enumView1 = "TextView"
    case enumView2 = "AlertView"
    case enumView3 = "PickerView"
    case enumView4 = "StackView"
    
    var id: String {
        self.rawValue
    }
    
    //이렇게 사용하려면 import Foundation을 SwiftUI로 바꿔줘야한다.
    var body: some View {
        switch self {
        case .enumView1:
            AlertView()
        case .enumView2:
            TextFieldView()
        case .enumView3:
            PickerView()
        case .enumView4:
            StackView()
        }
    }
        
}
