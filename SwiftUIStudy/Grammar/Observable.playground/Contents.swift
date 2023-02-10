import SwiftUI

//
//  SampleView.swift
//  Cafe
//
//  Created by 강대민 on 2022/11/15.
//

import SwiftUI

//관찰 가능한이기 떄문에 '옵저버블'오브젝트이다.
//그리고 꼭 클래스여야한다.
class ButtonModel: ObservableObject {
    //1. 이렇게되면 다른 뷰에서도 사용이 가능해진다.
    @Published var isDisabled = true
    
}

//2. 이런식으로 똑같이 쉽게 사용 가능하다.
struct PrarentView2: View {
    @ObservedObject var buttonModel = ButtonModel()
    
    var body: some View {
        //ChildView(isDisabled: $isDisabled) //바인드의 state에 대한 사용법
        ChildView(isDisabled: $buttonModel.isDisabled)
    }
    
    
}

//바인딩을 위한 부모뷰 생성
struct ParentView: View {
    
    //이렇게되면 값을 가진존재는 부모뷰가 된다.
    //이건 바인드사용법.
    //@State private var isDisabled = true
    
    @ObservedObject var buttonModel = ButtonModel()
    
    var body: some View {
        //ChildView(isDisabled: $isDisabled) //바인드의 state에 대한 사용법
        ChildView(isDisabled: $buttonModel.isDisabled)
    }
}


//자식뷰.
struct ChildView: View {
    //텍스트필드용
    @State private var currentText = ""
    //버튼용
//    @State private var isDisabled = true
    //자식뷰에서 부모뷰로 값을 넘겨주려면 binding으로 바꿔주어야한다.
    //private를 사용하면 다른 뷰에서 사용 불가능하기 떄문에 지워준다.
    @Binding var isDisabled: Bool
    
    
    var body: some View {
        VStack {
            //TextField(<#T##title: StringProtocol##StringProtocol#>, text: <#T##Binding<String>#>)
            //값을 바인딩 시킬떄에는 꼭 $ 표시를 해주어야한다.
            TextField("텍스트를 입력해주세요.", text: $currentText)
            Text(currentText)
            
            //버튼
            Toggle(isOn: $isDisabled, label: {
                Text("버튼 비활성화")
            })
            Button("버튼") {}
                .disabled(isDisabled)
        }
        
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
//        ChildView()
        ParentView()
    }
}
