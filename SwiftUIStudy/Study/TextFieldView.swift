//
//  TextFieldView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/27.
//

import SwiftUI

struct TextFieldView: View {
    //var name = "" //이방법도 통하지 않는다.
    @State private var name = ""
    
    var body: some View {
        Form {
            //$표시는 양방향 바인딩을 의미한다. (입력받고 보내니까.)
            TextField("입력", text: $name)
            Text("입력한값")
            //여긴 읽기만하니까 양방향x
            Text("Input : \(name)")
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView()
    }
}
