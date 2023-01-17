//
//  StepperView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/12.
//

import SwiftUI

struct StepperView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        //스태퍼 사용, formatted로 소수점 제어, in으로 값 제한, step으로 + - 선택시에 값 조절(base는 2인듯)
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 1.0)
            .padding(.horizontal)
    }
}

struct StepperView_Previews: PreviewProvider {
    static var previews: some View {
        StepperView()
    }
}
