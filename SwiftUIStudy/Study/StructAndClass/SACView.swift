//
//  SACView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/03.
//


/*
 
 결론. mainview에서 변경한 값을 직접 전달하지 않으면 subView는 그 변경된 값을 알 수가 없다.
 
 */

import SwiftUI

struct SACUser {
    var firstName = "Bil"
    var lastName = "Baggins"
}


class SACClassUser {
    var firstName = "boo"
    var lastName = "Booo"
}

class SACClassUserObject: ObservableObject {
    @Published var firstName = "oob"
    @Published var lastName = "jecttt"
}

struct SACView: View {
    @State private var showingSheet = false
    //Struct를 이용한 @State로 값을 변경 후 NavigationLink등을 사용하여 다른 View로 이동할 시 변경된 값을 보낼 수 있지만
    //다른 View에서 user의 값을 변경해도 돌아올땐 그렇지 않다.
    @State private var user = SACUser()
    @State private var classUser = SACClassUser()
    @ObservedObject var objectUser = SACClassUserObject()
    
    
    
    var body: some View {
        
        VStack(spacing: 50) {
            VStack {
                Text("Struct User name is \(user.firstName) \(user.lastName)")
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
            
            //단순 class만으론 @State로 값을 변경할 수 없다.
            VStack {
                Text("Struct User name is \(classUser.firstName) \(classUser.lastName)")
                TextField("First name", text: $classUser.firstName)
                TextField("Last name", text: $classUser.lastName)
            }
            
            //이렇게 Class는 Object같은 래퍼를 사용해줘야 한다.
            VStack {
                Text("Struct User name is \(objectUser.firstName) \(objectUser.lastName)")
                TextField("First name", text: $objectUser.firstName)
                TextField("Last name", text: $objectUser.lastName)
            }
            
            //하지만 다른 View에서 User의 값을 변경하지 않는다면 굳이 Object를 사용해야 할까?
            Button("Move Sheet") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
//                SACSheetView()
                SACSheetView(name: user.firstName + user.lastName)
            }
            
        }
        .padding()
        
    }
}

struct SACSheetView: View {
    @Environment(\.dismiss) var dismiss
    //이렇게 상수를 걸어놓으면 이 View를 부를때 name에 값을 넣어줘야한다.
    let name: String
    
    //여기서도 한번 사용해보자.
    @State private var user = SACUser()
    @State private var classUser = SACClassUser()
    @ObservedObject var objectUser = SACClassUserObject()
    
    
    var body: some View {
        VStack(spacing: 20) {
            Text("상수로 받아온 값 : \(name)")
            
            VStack {
                Text("Struct User name is \(user.firstName) \(user.lastName)")
                TextField("First name", text: $user.firstName)
                TextField("Last name", text: $user.lastName)
            }
            
            VStack {
                Text("Struct User name is \(classUser.firstName) \(classUser.lastName)")
                TextField("First name", text: $classUser.firstName)
                TextField("Last name", text: $classUser.lastName)
            }
            
            VStack {
                Text("Struct User name is \(objectUser.firstName) \(objectUser.lastName)")
                TextField("First name", text: $objectUser.firstName)
                TextField("Last name", text: $objectUser.lastName)
            }
            
            
            Button("Dismiss") {
                dismiss()
            }
            
        }
        .padding()
    }
    
}



struct SACView_Previews: PreviewProvider {
    static var previews: some View {
        SACView()
    }
}
