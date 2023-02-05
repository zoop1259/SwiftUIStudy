//
//  SContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

struct SContentView: View {
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
