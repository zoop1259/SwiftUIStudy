//
//  ChampionView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/08/22.
//

import SwiftUI

struct ChampionView: View {
    @ObservedObject var viewModel = DDViewModel()
     @State private var searchText = ""
     
     var filteredChampions: [Champion] {
         if searchText.isEmpty {
             return viewModel.champions
         } else {
             return viewModel.champions.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
         }
     }
     
     var body: some View {
         NavigationView {
             List(filteredChampions) { champion in
                 Text(champion.name)
             }
             .searchable(text: $searchText) // Search functionality
             .navigationTitle("Champions")
         }
     }
 }

struct ChampionView_Previews: PreviewProvider {
    static var previews: some View {
        ChampionView()
    }
}
