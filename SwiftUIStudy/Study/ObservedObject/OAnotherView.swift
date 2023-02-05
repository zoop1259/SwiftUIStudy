//
//  OAnotherView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

struct OAnotherView: View {
    @ObservedObject var userWrapper: OUserWrapper

    var body: some View {
        VStack {
            Text("User Name: \(userWrapper.user.name)")
            Text("User Age: \(userWrapper.user.age)")
        }.onReceive(userWrapper.objectWillChange) { _ in
            print("userWrapper.user changed")
        }
        
//        let user = userWrapper.user
//
//        return Text("\(user.name), \(user.age)")
//            .onReceive(userWrapper.objectWillChange) { _ in
//                let _ = print("User updated", user.name, user.age)
//            }
    }
}

//struct OAnotherView_Previews: PreviewProvider {
//    static var previews: some View {
//        OAnotherView()
//    }
//}
