//
//  TextFieldView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI
import Combine

struct TextFieldView: View {
    //var name = "" //이방법도 통하지 않는다.
    @State private var name = ""
    @StateObject private var goal = TFVM()
    
    var body: some View {
        Form {
            //$표시는 양방향 바인딩을 의미한다. (입력받고 보내니까.)
            TextField("입력", text: $name)
            Text("입력한값")
            //여긴 읽기만하니까 양방향x
            Text("Input : \(name)")
            
            
            //텍필 combine써보기
            TextField("입력", text: $goal.goal.count)
                .keyboardType(.numberPad)
            //Just는 실패할 수 없고, 항상 값을 생산해냄.
            //onReceive는 failure가 never여야함. struct, enum, class같이 굳어진 타입들만이 해당 프로토콜을 따를 수 있다고 함.
            //여튼 failure == never는 Just밖에 없어 이런상황에 맞다.
                .onReceive(Just(goal.$goal.count)) { _ in
                    //숫자가 아니면 입력방지.
                    let filterString = goal.goal.count.filter { $0.isNumber }
                    if filterString != goal.goal.count {
                        goal.goal.count = filterString
                    }
                    //50을 넘으면 그냥 50
                    let filterMaxValue = Int(filterString) ?? 0
                    if filterMaxValue > 50 {
                        goal.goal.count = "50"
                    }
                }
                //키보드 내리기.
                .onTapGesture {
                    //goal.saveData()
                    UIApplication.shared.endEditing()
                }

            
        }
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}

//익스텐션으로 빼야한다.
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


class TFVM: ObservableObject {
    @Published var goal = Goal()
    
    //키보드 내리기용.여기선 2개지만 아마.. 각각의 TextField겠지..
    func saveData() {
        UserDefaults.standard.set(goal.count, forKey: "userGoalCount")
        UserDefaults.standard.set(goal.title, forKey: "userGoalTitle")
    }
}

struct Goal {
    var count: String = ""
    var title: String = ""
}
