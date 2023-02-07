//
//  SContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

struct SContentView: View {
    /*
     @StateObject와 @ObservedObject의 공통점
     1. ObservableObject 프로토콜을 따르는 객체를 필요로 한다.
     2. 이 프로토콜은 객체의 값이 바뀌기 전에 알려주는 퍼블리셔를 의미한다.
     3. SwiftUI가 화면을 다시 그리는 것을 가능하게 한다.
     
     그렇다면 차이점
     @ObservedObject
     1. 변화를 감지하지만 View가 다시 그려지면 값이 파괴된다.
     사용해야 하는 경우?
     1. 의존 관계로 주입하려면 사용한다.
     
     @StateObject
     1. 이것을 통해 관찰되고 있는 객체는 그들을 가지고 있는 View가 다시 그려져도 파괴되지 않는다.
     2. 이 차이점을 확인하려면 View가 다른View를 포함하고 있는 경우이다.
     언제 사용하면 좋을까?
     1. 이것을 써야하는 경우는 화면을 만들거나 다시 기를 수 있는 가능성이 있는 경우에 쓴다. (일관된 결과를 주기 때문)
     2. 그러나 동일한 @StateObject 인스턴스를 관찰하고 있는 자식들은 객체를 프로퍼티 래퍼로 표시할 필요가 없다.
     3. 여러군데에서 객체의 라이프사이클을 관리하게 돼서 그러지 않는 것이 좋다고 한다.
     
     
     
     */
    //viewModel은 @ObservedObject 사용
    @ObservedObject var viewModel = SViewModel()
    //sViewModel은 @StateObject 사용
    @StateObject var sViewModel = SViewModel()
    //그냥 State를 써보자
    @State private var testValue = 0
    
    var body: some View {
        VStack(spacing: 20) {
            
            SRandomNumberView()
            
            
            Text("View 새로 그리기용 변수 버튼: \(testValue)")
            Button("testValue 증가") {
                self.testValue += 1
            }
            
//            Spacer()
//
            Text("ObservedObject is: \(viewModel.count)")
                .border(.black, width: 2)
                .cornerRadius(20)
            Button("Increment Counter(ObservedObject의 값)") {
                viewModel.incrementCounter()
            }
//            Spacer()
//
            Text("ObservedObject is: \(viewModel.directCount)")
            Button("direct Count의 값)") {
                viewModel.directIncrementCounter()
            }
            
//            Spacer()
            Text("StateObject is: \(sViewModel.count)")
            Button("Increment Counter(StateObject의 값)") {
                sViewModel.incrementCounter()
            }

        }
    }
}

struct SContentView_Previews: PreviewProvider {
    static var previews: some View {
        SContentView()
    }
}
