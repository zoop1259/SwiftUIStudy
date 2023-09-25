//
//  LongPressGuesTureView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/09/25.
//

import SwiftUI

struct LongPressGuesTureView: View {
    @State private var isUnlocked = false
    @State private var secUnlocked = false
    @State private var checkText = ""
    
    var body: some View {
        VStack {
            Text("Is lock: \(isUnlocked.description)")
            Image(systemName: isUnlocked ? "lock" : "lock.open")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .onLongPressGesture {
                    self.isUnlocked.toggle()
            }
            
            Text("Second lock: \(secUnlocked.description)")
            Image(systemName: secUnlocked ? "lock" : "lock.open")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .onLongPressGesture {
                    self.secUnlocked.toggle()
            }
            
            Spacer()
            
            //State의 값이 변할때마다 view가 새로 그려지기에 그때그때 변한다.
            if isUnlocked && secUnlocked {
                Text("잠겼습니다")
                    .font(.title)
                    .foregroundColor(.green)
            } else {
                Text("둘다 잠궈주세요.")
            }
        }
    }
}

struct LongPressGuesTureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGuesTureView()
    }
}
