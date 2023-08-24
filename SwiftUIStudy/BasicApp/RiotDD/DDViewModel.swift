//
//  DDViewModel.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/08/22.
//

import SwiftUI

class DDViewModel: ObservableObject {
    @Published var champions: [Champion] = []
    
    init() {
        fetchChampions()
    }
    
    func fetchChampions() {
        guard let url = URL(string: "https://ddragon.leagueoflegends.com/cdn/11.18.1/data/ko_KR/champion.json") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let championDataWrapper = try decoder.decode(ChampionDataWrapper.self, from: data)
                    let champions = Array(championDataWrapper.data.values)
                    DispatchQueue.main.async {
                        self.champions = champions
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
