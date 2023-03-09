//
//  CombineSumMainView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/08.
//

import SwiftUI

struct CombineSumMainView: View {
    @ObservedObject var culc = CCulcModel()
    @State private var result: Int = 0
    
    var body: some View {
        
        VStack {
            
            TextField("첫번째 수", text: $culc.firstValue, axis: .horizontal)
            TextField("두번째 수", text: $culc.secondValue, axis: .horizontal)
            
            Text("계산결과: \(result)")

        }
        .onReceive(culc.calculation) { value in
            result = value
        }
    }
}

struct CombineSumMainView_Previews: PreviewProvider {
    static var previews: some View {
        CombineSumMainView()
    }
}
