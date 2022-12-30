//
//  PickerView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct PickerView: View {
    let students = ["Harry", "Hermione", "Ron"]  //피커 목록
    @State private var selectedStudent = "Harry" //베이스값.

    var body: some View {
        //NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) { //선언한 학생의 목록을 foreach로 묶고 id값을 self로하여 등록한다.
                        Text($0) //각 값은 $0으로 하나씩 하나씩 줄줄이 소세지
                    }
                }
            }
        //}
    }
}
struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}
