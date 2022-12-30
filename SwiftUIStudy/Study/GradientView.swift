//
//  GradientView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/29.
//

import SwiftUI

struct GradientView: View {
    var body: some View {
        //LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        //역방향도 가능하다.
        //LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .bottom, endPoint: .top)
        
        //가운데에 서 확 꺼지는 그라데이션
//        LinearGradient(gradient: Gradient(stops: [
//            Gradient.Stop(color: .white, location: 0.45),
//            Gradient.Stop(color: .black, location: 0.55),
//        ]), startPoint: .top, endPoint: .bottom)
        
        //stop없이 init으로 사용해도 된다.
//        LinearGradient(gradient: Gradient(stops: [
//            .init(color: .white, location: 0.45),
//            .init(color: .black, location: 0.55),
//        ]), startPoint: .top, endPoint: .bottom)
        
        //구체처럼 가운데서 모이게..
        //RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        
        //앵귤러를 사용하면 다양한 색상을 사용할 수 있다.
        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
    }
}

struct GradientView_Previews: PreviewProvider {
    static var previews: some View {
        GradientView()
    }
}
