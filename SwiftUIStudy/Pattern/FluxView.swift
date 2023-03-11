//
//  FluxView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/11.
//

import SwiftUI
import SwiftUI

// Action
enum CounterAction {
    case increment
    case decrement
}

// Store
class CounterStore: ObservableObject {
    @Published var count: Int = 0
    
    func dispatch(_ action: CounterAction) {
        switch action {
        case .increment:
            count += 1
        case .decrement:
            count -= 1
        }
    }
}

// View
struct FluxView: View {
    @StateObject private var counterStore = CounterStore()
    
    var body: some View {
        VStack {
            Text("Count: \(counterStore.count)")
            HStack {
                Button("Increment") {
                    counterStore.dispatch(.increment)
                }
                Button("Decrement") {
                    counterStore.dispatch(.decrement)
                }
            }
        }
    }
}

struct FluxView_Previews: PreviewProvider {
    static var previews: some View {
        FluxView()
    }
}
