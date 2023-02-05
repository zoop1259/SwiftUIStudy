//
//  OContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

struct OContentView: View {
//    @State var user = OUser(name: "", age: 0)
    //placeholder를 사용하고 싶다. 그러면 빈값이 없어야하는데...
    @ObservedObject var userWrapper = OUserWrapper(user: OUser(name: "", age: 0))
    
    var body: some View {
        VStack {
            TextField("Name", text: $userWrapper.user.name)
                .textFieldStyle(.roundedBorder)
            TextField("Age", value: $userWrapper.user.age, formatter: NumberFormatter())
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            NavigationLink(destination: OAnotherView(userWrapper: userWrapper)) {
                Text("go to anotherView")
            }
        }.onTapGesture {
            //UIApplication.shared.keyWindow?.endEditing(true) //iOS13에서 키보드 내리기
            //SwiftUI에서의 키보드 내리는 방법
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)



        }
        .padding()
        //이부분이 없어도 값을 읽어올수있는지. 궁금.
        OAnotherView(userWrapper: userWrapper)
        
        
//        VStack {                                          //아래의 onEditingChanged를 이렇게 축약할수있다.
//            TextField("Name", text: $userWrapper.user.name) { _ in
//                self.userWrapper.objectWillChange.send()
//            }
//            //Int형은 포맷을 해줘야한다. 그리고 키보드스타일을 변경해주면 좋다.
//            //onEditingChanged를 통해  objectWillChange.send()를 해주지 않으면 AnotherView에서 받질못한다.
//            TextField("Age", value: $userWrapper.user.age, formatter: NumberFormatter(), onEditingChanged: { _ in
//                self.userWrapper.objectWillChange.send()
//            })
//                .keyboardType(.decimalPad)
//        }
    }
    
}

struct OContentView_Previews: PreviewProvider {
    static var previews: some View {
        OContentView()
    }
}
