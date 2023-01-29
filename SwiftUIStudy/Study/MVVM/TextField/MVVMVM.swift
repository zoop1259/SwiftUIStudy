//
//  ViewModel.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/29.
//

import SwiftUI
import Combine

//뷰모델
class MVVMVM: ObservableObject {
    @ObservedObject var data: MVVMM
    
    init(data: MVVMM) {
        self.data = data
    }
}
