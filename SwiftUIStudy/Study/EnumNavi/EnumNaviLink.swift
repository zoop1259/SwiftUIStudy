//
//  EnumNaviLink.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/11.
//

import SwiftUI

struct EnumNaviLink: View {
    var body: some View {
        NavigationStack {
            ForEach(EnumSetting.allCases) { settings in
                NavigationLink(settings.rawValue, value: settings)
            }
                .buttonStyle(.bordered)
//                .navigationDestination(for: EnumSetting.self) { settings in
//              settings
                .navigationDestination(for: EnumSetting.self) { $0
//                    AlertView()
                    //아래처럼하면 mainView가 길어지기떄문에 옮긴다.
//                    switch settings {
//                    case .enumView1:
//                        AlertView()
//                    case .enumView2:
//                        TextFieldView()
//                    case .enumView3:
//                        PickerView()
//                    case .enumView4:
//                        StackView()
//                    }
                }
                .navigationTitle("Enum Navigation")
            
            
        }
        
    }
}

struct EnumNaviLink_Previews: PreviewProvider {
    static var previews: some View {
        EnumNaviLink()
    }
}
