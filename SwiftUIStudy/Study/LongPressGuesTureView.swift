//
//  LongPressGuesTureView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/09/25.
//

import SwiftUI

struct LongPressGuesTureView: View {
    @State private var isUnlocked = false
    
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
        }    }
}

struct LongPressGuesTureView_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGuesTureView()
    }
}
