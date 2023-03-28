//
//  PopupView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/15.
//

import SwiftUI
import PopupView

struct PopupView: View {
    @State var showingPopup = false
    @State var botPopup = false
    
    var body: some View {
        ZStack {
            VStack {
                Button(action: {
                    self.showingPopup.toggle()
                }) {
                    Text("토스트 띄우기")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Button(action: {
                    self.botPopup.toggle()
                }) {
                    Text("하단 토스트 띄우기")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(.purple)
                        .cornerRadius(10)
                }
            }
        }
        .popup(isPresented: $botPopup) {
            botToastMessage()
        } customize: {
            $0
                .type(.toast) //default면 토스트? 그냥 toast로 해도된다.
                .position(.bottom) //어디서 올라오는가.
                .animation(.spring()) //올라오거나 내려가는 애니메이션 효과
                .closeOnTap(true) //탭하면 닫을것인지.
                .autohideIn(2) //2초뒤에 자동으로 사라짐.
//                .backgroundColor(.black.opacity(0.5)) //토스트가 올라올때 상위뷰의 어두움정도?
        }
        .popup(isPresented: $showingPopup) {
            toastMessage()
        } customize: {
            $0
                .type(.default) //default면 토스트? 그냥 toast로 해도된다.
                .position(.bottom) //어디서 올라오는가.
                .animation(.spring()) //올라오거나 내려가는 애니메이션 효과
                .closeOnTap(true) //탭하면 닫을것인지.
                .autohideIn(2) //2초뒤에 자동으로 사라짐.
//                .backgroundColor(.black.opacity(0.5)) //토스트가 올라올때 상위뷰의 어두움정도?
        }

    }
    
    //기본 토스트
    func toastMessage() -> some View {
        Text("토스트 메세지!!!")
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
    
    //하단 토스트
    func botToastMessage() -> some View {
        
        HStack(spacing: 10) {
            
            Image(systemName: "book.fill")
                .font(.system(size:40))
                .foregroundColor(.white)
            
            VStack(alignment: .leading) {
                Text("안내 메세지")
                    .fontWeight(.black)
                    .foregroundColor(.white)
            
                Text("토스트 메세지 입니다. 하단에서 올라오죠???")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                Divider().opacity(0)
            }
        }
        .padding([.vertical,.horizontal], 5)
        .frame(width: UIScreen.main.bounds.width)
        //네비게이션바가 없는 기종이면 padding이 0 있는 기종엔 15
        .padding(.bottom, UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 0 : 15)
        .background(Color.purple)
    }
    
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView()
    }
}
