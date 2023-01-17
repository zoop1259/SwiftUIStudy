//
//  BetterRest.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/12.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        //                              순서가 뒤죽박죽이여도 알아서 정해진다.
//        Text(Date.now, format: .dateTime.hour().month().year().minute().day())
        //다쓸꺼면 이렇게 쓰는게 더 간단하다.
//        Text(Date.now.formatted(date:.long, time: .shortened))
        Text(Date.now.formatted(date:.long, time: .omitted)) //연월일
        
    }
    
    
    
    func trivaialExample() {
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour
        let minute = components.minute
        
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components)
        
    }
    
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
