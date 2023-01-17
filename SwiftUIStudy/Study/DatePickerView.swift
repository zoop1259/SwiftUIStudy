//
//  DatePickerView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/12.
//

import SwiftUI

struct DatePickerView: View {
    @State private var wakeUp = Date.now //현재 시간을 가져온다.
    
    var body: some View {
//        DatePicker("날짜를 정해주세요 :", selection: $wakeUp) //일 시 분
//        DatePicker("시간을 정해주세요 :", selection: $wakeUp, displayedComponents: .hourAndMinute) //시간까지만 만약 .date라면 월일년
        DatePicker("시간을 정해주세요 :", selection: $wakeUp, in: Date.now...) //이렇게 날짜를 정해버리면 당일 이전은 선택불가능하게 된다.
            //.labelsHidden() //레이블을 가려준다. 그리고 중앙정렬된다.
            .padding(.horizontal)
    }
    
    func exampleDate() {
        let tomorrow = Date.now.addingTimeInterval(86400)
        let range = Date.now...tomorrow
    }
    
    
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
