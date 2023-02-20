//
//  TextView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI


struct TextView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("이렇게 무지성으로 cornerRadius를 주면 침범")
                .border(.black, width: 2)
                .cornerRadius(20)
                .underline() //밑줄
                .baselineOffset(30) //밑에 offset주기
          
            Text("이렇게 패딩을 넣어주면 침범은 안하는데 꼭지점이 이상함")
                .font(.caption)
                .padding(10)
                .border(.red, width: 2)
                .cornerRadius(10)
                .strikethrough() //가운데 선긋기
          
            // 문자간의 offset을 조절
            Text("test1 test2 test3 test123")
              .kerning(30)
            
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
