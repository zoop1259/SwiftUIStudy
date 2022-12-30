//
//  SearchBar.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2022/12/28.
//

import SwiftUI

struct SearchBarView: View {
    
    @State private var searchText: String = "" //상태 변수 추가.
    
    private var searchResults: [EmojiDetails] {
        let results = EmojiProvider.all()
        //서치 텍스트가 비어있으면 모든목록을 보여준다.
        if searchText.isEmpty { return results }
        
        return results.filter {
            $0.name.lowercased().contains(searchText.lowercased()) ||
            $0.emoji.contains(searchText)
        }
    }
    
    private var suggestedResults: [EmojiDetails] {
        if searchText.isEmpty { return [] }
        return searchResults
    }
    
    var body: some View {
        List(searchResults) { emojiDetails in
            NavigationLink(destination: {
                EmojiDetailsView(emojiDetails: emojiDetails)
            }) {
                Text("\(emojiDetails.emoji) \(emojiDetails.name)")
                    .padding(5)
            }
        }
        .navigationTitle("Emoji Search") //미리보기화면에서는 안보이지만 메인뷰에서 이동되면 보인다.
        .searchable(
            text: $searchText,
            //항상 검색할 수 있도록. .automatic이면 스크롤중엔 없어지는듯.
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search for emoji"
        ) {
            ForEach(suggestedResults) { emojiDetails in
                Text("Lokking for \(emojiDetails.emoji)?")
                    .searchCompletion(emojiDetails.name)
            }
        }
    }
}

struct EmojiDetailsView: View {
    let emojiDetails: EmojiDetails
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(emojiDetails.emoji) \(emojiDetails.name)")
                    .font(.largeTitle)
                    .bold()
                Text(emojiDetails.description)
                Spacer()
            }
            Spacer()
        }.padding([.leading, .trailing], 24)
    }
}


struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}


