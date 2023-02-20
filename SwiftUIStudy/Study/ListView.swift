//
//  ListView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/20.
//

import SwiftUI

struct ListView: View {
  let people = ["김","나","박","이"]
  
    var body: some View {
      List(people, id: \.self) { 
        Text($0)
      }
      .listStyle(.grouped) //스타일 지정
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
