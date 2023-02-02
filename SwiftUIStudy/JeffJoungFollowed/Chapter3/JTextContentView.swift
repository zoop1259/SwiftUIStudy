//
//  JTextContentView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/02.
//

import SwiftUI

struct JTextContentView: View {
    
    static let JdateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 M월 d일 d일_" //YY는 연도로 변환해주는거 같고 M은 월, d는 그저 날짜로 변환해주는거 같다.
//        formatter.dateStyle = .long //간단히 이런식으로 해도된다.
        return formatter
    }()
    
    private var today = Date()
    
    var body: some View {
        VStack {
                        
            Text("잔디가 노새, 지나고 별을 시인의 시와 별빛이 이름과, 봅니다. 밤이 가을로 했던 별 듯합니다. 멀리 밤이 소학교 아침이 하나에 위에 이 봅니다.")
                .tracking(2) //글자간의 거리.
    //            .font(.title) //각각 조절할시에는 이런식으로 쓰고.
    //            .fontWeight(.bold)
    //            .fontDesign(.rounded)
                .font(.system(.title, design: .rounded, weight: .bold)) //다양하게 한번에 적용하려면 .system사용
                .multilineTextAlignment(.center) //기본값은 leading이다.
                .lineLimit(nil) //스유에선 0을 써도 1이다. 기본값은 nil인듯.
                .lineSpacing(10) //라인끼리의 공간
                
                //.truncationMode(.middle) //'...'을 어디에 넣을 것인가에 대한 코드. 그런데...스니펫이 좀...이상한데?
            
                .shadow(color: Color.red ,radius: 1.5, x:5, y: 5) //그림자 효과.
                .padding(20) //기본값은 10이다. 기본값은 모든 방향에 패딩이 들어간다.
                .background(Color.green)
            
                .padding(20) //패딩 안에 또 패딩을 넣어주면 아래의 텍스트사이에 패딩이 생긴다.
                .background(Color.yellow) //바로위의 padding에 컬러가 들어간다.
                .cornerRadius(20) //바로위의 컬러에 코너레디우스가 걸린다.
            
                .padding(.bottom ,20) //패딩 안에 또 패딩을 넣어주면 아래의 텍스트사이에 패딩이 생긴다.
            
            Text("두번째 텍스트")
                .background(Color.gray)
                .foregroundColor(Color.white)
//                .padding(.top, 20) //아니면 여기서 탑으로 패딩을 주면 위랑 벌어지겠지.
            
            Text("오늘은: \(today, formatter: JTextContentView.JdateFormat)")
            
        }
    }
}

struct JTextContentView_Previews: PreviewProvider {
    static var previews: some View {
        JTextContentView()
    }
}
