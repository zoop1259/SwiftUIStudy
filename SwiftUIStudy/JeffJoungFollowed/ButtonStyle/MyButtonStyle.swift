//
//  MyButtonStyle.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/15.
//

import SwiftUI

//버튼스타일 상속
struct MyButtonStyle: ButtonStyle {
    
    enum Style {
        case normalTap
        case longTap
        case short
        case rotate
        case blur
    }
    
    var style = Style.normalTap
    
    func makeBody(configuration: Configuration) -> some View {
//        configuration.label //라벨
//        configuration.isPressed //터치됐는지
//        configuration.self //자기자신.

        switch style {
        case .normalTap :
            configuration.label
                .padding()
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 1.3 : 1.0) //터치 순간!
                .onTapGesture {
                    let haptic = UIImpactFeedbackGenerator(style: .light) //햅틱추가
                    haptic.impactOccurred() //햅틱 적용시키기
                }
            
        case .longTap :
            configuration.label
                .padding()
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(.green)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 1.6 : 1.0) //터치 순간!
                .onLongPressGesture {
                    let haptic = UIImpactFeedbackGenerator(style: .heavy) //햅틱 진동 크게 추가
                    haptic.impactOccurred() //햅틱 적용시키기
                }
            
        case .short :
            configuration.label
                .padding()
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(.purple)
                .cornerRadius(20)
                .scaleEffect(configuration.isPressed ? 0.7 : 1.0) //터치 순간!
            
        case .rotate :
            configuration.label
                .padding()
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(20)
                .rotationEffect(configuration.isPressed ? .degrees(360) : .degrees(0))
            
            
        case .blur :
            configuration.label
                .padding()
                .font(.system(.title3, design: .rounded, weight: .bold))
                .foregroundColor(.white)
                .background(.black)
                .cornerRadius(20)
                .blur(radius: configuration.isPressed ? 5 : 0)
            
            
        }


    }
    
}

struct MyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button("normal Tap") {
                print("버튼탭됨.")
            }.buttonStyle(MyButtonStyle(style: .normalTap))
            
            Button("long Tap") {
                print("버튼탭됨.")
            }.buttonStyle(MyButtonStyle(style: .longTap))
            
            Button("cut button") {
                print("버튼탭됨.")
            }.buttonStyle(MyButtonStyle(style: .short))
            
            Button("rotate button") {
                print("버튼탭됨.")
            }.buttonStyle(MyButtonStyle(style: .rotate))
            
            Button("blur button") {
                print("버튼탭됨.")
            }.buttonStyle(MyButtonStyle(style: .blur))
        }
    }
}
