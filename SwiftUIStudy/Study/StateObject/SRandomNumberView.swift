//
//  SRandomNumberView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

struct SRandomNumberView: View {
    @State var randomNumber = 0
    //viewModel은 @ObservedObject 사용
    @ObservedObject var viewModel = SViewModel()
    //sViewModel은 @StateObject 사용
    @StateObject var sViewModel = SViewModel()
    
    
    var body: some View {
        VStack(spacing:20) {
            
            Text("Random number is: \(randomNumber)")
            
            Button("Randomize number") {
                randomNumber = (0..<1000).randomElement()!
            }
            
            Text("ObservedObject is: \(viewModel.count)")
            Button("Increment Counter(랜덤뷰에서의 ObservedObject의 값)") {
                viewModel.incrementCounter()
            }
//            Spacer()

//            Spacer()
            Text("StateObject is: \(sViewModel.count)")
            Button("Increment Counter(랜덤뷰에서의 StateObject의 값)") {
                sViewModel.incrementCounter()
            }
            
//            Spacer()
//
//            SContentView()
//
//            NavigationLink(destination: AlertView()) { //네비링크만으로는 뷰를 새로 그리지 않기때문에 값에 영향 X
//                Text("뷰이동 실험용.")
//            }
            
        }.padding([.top, .bottom], 20) //탑바텀에 50씩
 
       
    }
}

struct SRandomNumberView_Previews: PreviewProvider {
    static var previews: some View {
        SRandomNumberView()
    }
}
