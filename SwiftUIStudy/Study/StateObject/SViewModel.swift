//
//  SViewModel.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI

final class SViewModel: ObservableObject {
    //옵저버블오브젝트를 사용하여 퍼블리시해서 관찰.
    @Published var count = 0

    func incrementCounter() {
        count += 1
    }
    
    //이 방법은 Published를 objectWillChange 메서드를 통해 수동으로 쏴버리는 건데.
    //쓰는 경우는 여러값을 변경 후 수동으로 신호를 쏘는것이 더 나은경우가 있는데 그때 쓸만하다 한다.
    private(set) var directCount = 0
    
    func directIncrementCounter() {
        directCount += 1
        objectWillChange.send()
    }
    
}

