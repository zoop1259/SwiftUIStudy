//
//  TextView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI


struct TextView: View {
    
    @State var str = ""
    
    //텍스트 탭 애니메이션 용 변수.
    @State private var isTapped = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("기본적인 텍스트.")
                //접근성 특성
                .accessibilityLabel("접근성 특성 라벨.")
            
            VStack {
                Text("베이스라인을 조절한 Text")
                    .baselineOffset(1) //양수면 문자열이 위로, 음수면 문자열이 아래로 이동한다.
                    .onAppear {
                        print("뷰가 등장했다.") //appear
                    }
                    .onDisappear {
                        print("뷰가 사라진다.")
                    }
                
                Text("컨텍스트 메뉴 Text")
                    .rotationEffect(.degrees(15)) //살짝 돌리기
//                    .scaleEffect(1.5) //텍스트뷰를 확대 또는 축소인데. 이것은 탭 제스처와 함께 써야할 듯.
//                    .offset(x:10,y: 10) //지정하여 위치를 이동시키기.
                
                    .contextMenu {
                        Button {
                            print("1번")
                        } label: {
                            Text("Menu1")
                        }
                        
                        Button {
                            print("2번")
                        } label: {
                            Text("Menu2")
                        }
                    }
            }
            
            HStack {
                Text("이게이렇게 길면 옆이 밀릴텐데 요오오오오")
                    .lineLimit(1)
                    .truncationMode(.middle) //글이 짤리는 경우 정한방향(앞,뒤,중간)을 생략해준다.
                    .minimumScaleFactor(.greatestFiniteMagnitude) //글시가 짤릴떄 텍스트의 최소 크기 설정 현재 설정은 자동으로 조절해주는것이고 (0.01~0.5의 범위조절이 가능하다 0.5는 50%다.)
                Text("여기에 Factor를 한번")
                    //.minimumScaleFactor()
            }
            
            VStack {
                Text("탭시 애니메이션 효과")
                    .foregroundColor(isTapped ? .red: .black)
                    .animation(.easeOut(duration: 1.0))
                    .onTapGesture {
                        self.isTapped.toggle()
                    }
                HStack {
                    Text("텍스트들은")
                        .lineLimit(1)
                        .font(.title3)
                        .fixedSize(horizontal: true, vertical: false) //가로 방향으로만 고정
                    
                    TextField("텍스트사이에 자유로운 텍스트필드", text: $str)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8.0)
                    Text("크기고정")
                        .lineLimit(1)
                        .font(.title3)
                        .fixedSize(horizontal: true, vertical: false) //가로 방향으로만 고정
                    
                }
            }
            
            Text("이렇게 무지성으로 cornerRadius를 주면 침범")
                .border(.black, width: 2)
                .cornerRadius(20)
                .underline() //밑줄
                .baselineOffset(30) //밑에 offset주기
          
            Text("이렇게 패딩을 넣어주면 침범은 안하는데 꼭지점이 이상함요요요")
                .lineLimit(2)
                .font(.caption)
                .padding(10)
                .border(.red, width: 2)
                .cornerRadius(10)
                .strikethrough() //가운데 선긋기
            
          
            // 문자간의 offset을 조절
            Text("test1 test2 test3 test123")
              .kerning(30)
              .foregroundColor(.blue)
              .multilineTextAlignment(.trailing) //텍스트의 정렬방식 설정
            
            // 문자간의 offset을 조절하는게 아니라, 후행 공백을 추가하거나 제거하여 조절
            Text("test1 test2 test3 test123")
              .tracking(30)
          
            Text("jhchoo with Swift")
                .padding()
                .overlay( //뷰 위에 다른 뷰를 겹처 그리는 기능, 뷰를 그리는 것이다. 뷰의 모양을 변경하는것은 아니다.
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.blue, lineWidth: 4)
                )
            
            Text("Text with background")
                .padding(10)
                //배경색을 설정하거나 배경을 그릴때 사용된다. 배경을 그리는 것이다. 역시 뷰의 모양을 변경하는것은 아니다.
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 5))

        }
    }
  
  func textTest() {
//    let input = """
//a
//b
//c
//"""
//
//    let letters = input.components(separatedBy: "\n")
//    let letter = letters.randomElement()
//
//    let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
    
    let word = "swift"
    //하지만 objc는 문자를 저장하는 이 방법을 사용하지 않는다.
    let checker = UITextChecker()
    //objc형식으로 Range를 잰다.
    let range = NSRange(location: 0, length: word.utf16.count)
    let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "ko")
    let allGood = misspelledRange.location == NSNotFound
    
  }
  
}

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView()
    }
}
