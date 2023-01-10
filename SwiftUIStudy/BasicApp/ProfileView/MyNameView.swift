//
//  MyNameView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

struct MyNameView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ming Dae")
                .font(.title)
            HStack {
                Text("iOS")
                    .font(.subheadline)
                Spacer()
                Text("Developer")
                    .font(.subheadline)
            }
            .foregroundColor(.secondary)
        }
        .padding()
    }
}

struct MyNameView_Previews: PreviewProvider {
    static var previews: some View {
        MyNameView()
    }
}
