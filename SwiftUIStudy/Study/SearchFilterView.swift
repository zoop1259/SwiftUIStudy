//
//  SearchFilterView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/08/25.
//

import SwiftUI

struct SearchFilterView: View {

    @State private var searchText = ""
     let words = ["가지", "나라"]

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

extension UnicodeScalar {
    var isHans: Bool {
        return value >= 0xAC00 && value <= 0xD7A3
    }
}
