//
//  Champion.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/08/22.
//

import SwiftUI

struct Champion: Identifiable, Decodable {
    let id: String
    let name: String
    // Add other properties you want to display
    
    enum CodingKeys: String, CodingKey {
        case id = "key"
        case name
    }
}

struct ChampionDataWrapper: Decodable {
    let data: [String: Champion]
}
