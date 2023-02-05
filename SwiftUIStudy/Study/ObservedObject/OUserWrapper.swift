//
//  OUserWrapper.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/02/05.
//

import SwiftUI
import Combine

class OUserWrapper: ObservableObject {
    @Published var user : OUser
    
    init(user: OUser) {
        self.user = user
    }
}


