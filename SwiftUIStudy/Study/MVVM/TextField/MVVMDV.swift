//
//  MVVMDV.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/29.
//
//디테일뷰.

import SwiftUI
import Combine

struct MVVMDV: View {
    @ObservedObject var viewModel: MVVMVM
    
    var body: some View {
        VStack {
            Text("MVVMTFV에서 입력된 데이터: \(viewModel.data.text)")
                .padding()
        }
    }
}
