//
//  ShowingAndHidingView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/01.
//

import SwiftUI

struct ShowingAndHidingView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("탭 탭") {
                withAnimation {
                    isShowingRed.toggle() //버튼을 통해 bool값을 변경
                }
            }
            
            //true일때만 사각형이 나타나게.
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                   // .transition(.asymmetric(insertion: .scale, removal: .opacity))
                //커스텀한 modifier사용
                    .transition(.pivot)
            }
        }
    }
}

//modifier를 통해 회전이 발생해야 하는 위치를 제어하는 앵커 포인트와 적용되는 회전의 양을 제어하는 크기가 있는 구조체
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

struct ShowingAndHidingView_Previews: PreviewProvider {
    static var previews: some View {
        ShowingAndHidingView()
    }
}

//pivot이라는 변수에 modifier를 사용하여 anytransition를 원하는 맛으로
extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}
