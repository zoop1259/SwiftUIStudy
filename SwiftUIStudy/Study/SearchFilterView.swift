//
//  SearchFilterView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/08/25.
//

import SwiftUI

struct SearchFilterView: View {
    //입력받을 변수
    @State private var searchText = ""
    //검색 대상으로 사용될 단어 목록.
    let words = ["가지", "나라"]
    
/*
 아래의 함수는 searchText를 기반으로 초성부터 필터링된 단어 목록을 반환하는 함수.
 초성을 변환한것을 담는 변수를 생성
 단어목록을 필터링(클로저를통하여)을 반환함
 또 새로운 변수로 초성을 변환한 것을 담는 변수를 하나 더 생성
 초성 필터링된 단어와 검색어의 초성을 비교하여 리턴.
 */
     func filteredWords(_ searchText: String) -> [String] {
         let chosungSearchText = convertToChosung(searchText)
         return words.filter { word in
             let chosungWord = convertToChosung(word)
             return chosungWord.localizedCaseInsensitiveContains(chosungSearchText)
         }
     }

     var body: some View {
         NavigationView {
             List(filteredWords(searchText), id: \.self) { word in
                 Text(word)
             }
             .searchable(text: $searchText)
             .navigationTitle("Filtered Words")
         }
     }

     func convertToChosung(_ text: String) -> String {
         let koreanConsonants: [Character] = [
             "ㄱ", "ㄲ", "ㄴ", "ㄷ", "ㄸ", "ㄹ", "ㅁ", "ㅂ", "ㅃ",
             "ㅅ", "ㅆ", "ㅇ", "ㅈ", "ㅉ", "ㅊ", "ㅋ", "ㅌ", "ㅍ", "ㅎ"
         ]

         /*
          위에서 초성배열을 생성.
          result로 문자열 초기화
          함수가 호출될때 입력받은 문자열인 text 반복문 시작.
          그리고 문자의 유니코드 스칼라 값을 가져온다. 그리고 한글인지 확인하는 조건문 시작.
          한글의 유니코드 범위에서 초성을 계산하는 수식을 사용하여 저장하는 변수 생성
          계산된 초성을 추가
          한글이 아닌 문자의 경우를 계산
          한글이 아닌문자는 그냥 추가.
          
          
          
          */
         var result = ""
         for character in text {
             if let scalar = character.unicodeScalars.first, scalar.isHans {
                 let chosungIndex = (scalar.value - 0xAC00) / 588
                 result.append(koreanConsonants[Int(chosungIndex)])
             } else {
                 result.append(character)
             }
         }
         return result
     }
    
    //    @State private var searchText = ""
//    let words = ["가지", "나라"]
//
//    func filteredWords(_ searchText: String) -> [String] {
//        let chosungSearchText = convertToChosung(searchText)
//        return words.filter {
//            let chosungWord = convertToChosung($0)
//            return chosungWord.localizedCaseInsensitiveContains(chosungSearchText)
//        }
//    }
//
//    var body: some View {
//        NavigationView {
//            List(filteredWords(searchText), id: \.self) { word in
//                Text(word)
//            }
//            .searchable(text: $searchText)
//            .navigationTitle("Filtered Words")
//        }
//    }
//
//    func convertToChosung(_ text: String) -> String {
//        let hangul = text.unicodeScalars
//            .filter { (0xAC00 <= $0.value && $0.value <= 0xD7A3) }
//            .map { UnicodeScalar(0x1100 + (($0.value - 0xAC00) / 28) / 21)! }
//        return String(String.UnicodeScalarView(hangul))
//    }
}

struct SearchFilterView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterView()
    }
}


/*
 
 유니코드 스칼라 확장
 한글 유니코드 범위인지 확인하는 변수 생성
 유니코드 범위에 있는지 확인하고 리턴.
 
 */
extension UnicodeScalar {
    var isHans: Bool {
        return value >= 0xAC00 && value <= 0xD7A3
    }
}
