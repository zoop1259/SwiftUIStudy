//
//  MVVMM.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/29.
//

import SwiftUI
import Combine

//데이터 모델.
class MVVMM: ObservableObject {
    @Published var text: String = "입력된 데이터"
}

