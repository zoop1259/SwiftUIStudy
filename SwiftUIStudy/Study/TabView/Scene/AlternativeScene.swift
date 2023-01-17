//
//  AlternativeScene.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

struct AlternativeScene: Scene {
    var body: some Scene {
        WindowGroup {
            AlternativeContentView()
        }
        
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
