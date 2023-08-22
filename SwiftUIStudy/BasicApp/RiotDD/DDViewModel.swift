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
                    let championsData = try decoder.decode([String: [Champion]].self, from: data)
                    if let championList = championsData["data"] {
                        DispatchQueue.main.async {
                            print(championList)
                            self.champions = championList
                        }
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}
