//
//  MultiplatformSampleCode.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/03/29.
//

import SwiftUI

struct MultiplatformSampleCode: View {
    var body: some View {
        Text("Hello, World!")
        #if os(iOS)         //ios
            .padding(10)
        #elseif os(watchOS) //watchOS
            .padding(4)
        #else               //macOS
            .padding(24)
        #endif
        
        Text("Extension을 사용한 클린 코드?")
            .padding(Double(iOS: 10, watchOS: 4, macOS: 24))
        
    }
}

struct MultiplatformSampleCode_Previews: PreviewProvider {
    static var previews: some View {
        MultiplatformSampleCode()
    }
}

//double을 extension하여 모든 플랫폼에서
extension Double {
    init(iOS: Self, watchOS: Self, macOS: Self) {
        #if os(iOS)
        self = iOS
        #elseif os(watchOS)
        self = watchOS
        #else // macOS
        self = macOS
        #endif
    }
}
