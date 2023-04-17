//
//  LocalizationView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/20.
//

import SwiftUI

struct LocalizationView: View {
    @State var one = 1
    @State var two = 2
    var count = 2
    
    var body: some View {
        VStack {
            
            VStack {
                Text("영어")
                    .fontWeight(.bold)
                    .padding()
                Text("^[\(one) Person](inflect: true)")
                Text("^[\(two) Person](inflect: true)")
                Text("^[\(two) kid](inflect: true)")
                Text("^[\(two) time](inflect: true)")
                Text("^[\(2) \(String(localized: "Medium"))](inflect: true)")
                Text("^[\(two) Medium](inflect: true)")
                
                
            }
            
            
            VStack {
                Text("일본어")
                    .fontWeight(.bold)
                    .padding()
                Text("^[\(one) 人](inflect: true)")
                Text("^[\("3") 人](inflect: true)")
                
            }
            
            Text("스페인어")
                .fontWeight(.bold)
                .padding()
            Text("^[\(one) persona](inflect: true)")
            Text("^[\(two) persona](inflect: true)")
            
            
            Text("한국어")
                .fontWeight(.bold)
                .padding()
            Text("^[\(two) 권](inflect: true)")
            
        }
        .padding()
        .environment(\.locale, .init(identifier: "ko"))
    }
}

struct LocalizationView_Previews: PreviewProvider {
    static var previews: some View {
        LocalizationView()
    }
}
