//
//  ScanData.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/03.
//

import Foundation

struct ScanData:Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String) {
        self.content = content
    }
}

