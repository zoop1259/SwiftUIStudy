//
//  MVVMMV.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/29.
//
//메인뷰

import SwiftUI
import Combine

struct MVVMMV: View {
    @ObservedObject var data = MVVMM()
    @ObservedObject var viewModel = MVVMVM(data: MVVMM())
    
    var body: some View {
        VStack {
            NavigationLink(destination: MVVMDV(viewModel: viewModel)) {
                Text("디테일뷰로")
            }
            MVVMTFV(viewModel: viewModel)
        }
        .navigationTitle(Text("MVVM TextField"))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MVVMMV_Previews: PreviewProvider {
    static var previews: some View {
        MVVMMV()
    }
}
