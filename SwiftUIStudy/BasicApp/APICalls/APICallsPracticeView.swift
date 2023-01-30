//
//  APICallsPracticeView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/30.
//

import SwiftUI

struct APICallsPracticeView: View {
    @StateObject var viewModel = APICallsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.courses, id: \.self) { course in
                HStack {
                    APICallsImageView(urlString: course.image)
                    
                    Text(course.name)
                        .bold()
                }
                .padding(3)
            }
        }
        .navigationBarTitle("APICallsPractice")
        .onAppear {
            viewModel.fetch()
        }
    }
}

struct APICallsPracticeView_Previews: PreviewProvider {
    static var previews: some View {
        APICallsPracticeView()
    }
}
