//
//  ProfileView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)
            MyImageView()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                MyNameView()
                    
                Divider() //줄 긋기.
                
                VStack(alignment: .leading) {
                    Text("신입개발자가 되기 위해")
                        .font(.title2)
                    Text("열 공 하 는 나")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding() //이걸 해줘야 NameView의 텍스트와 바로위의 텍스트들의 들여쓰기가 맞게된다.
            }
                .padding()
                Spacer() //위로 쭉 밀어냄
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
