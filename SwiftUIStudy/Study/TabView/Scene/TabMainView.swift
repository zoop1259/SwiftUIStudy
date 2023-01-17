//
//  TabMainView.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/01/11.
//

import SwiftUI

//이렇게 Scene에는 2가지 이상의 뷰를 담을 수 있다.
//그러나 Scene에는 단독으로 Text를 사용할 수 없다.
//그리고 다른 View에서 TabMainView에 View가 없다며 다른 뷰에서 사용할 수 없다.
/*
 NavigationLink(destination: TabMainView()) { //error
     Text("Tab으로 Scene")
 }
 */

struct TabMainView: Scene {
    var body: some Scene {
        WindowGroup {
            TabView {
                JournalView()
                    .tabItem {
                        Label("Journal", systemImage: "book")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}


/*
 struct TabMainView: View { <- View를 Scene으로 교체할시 당장은 미리보기를 할 수 없다.
 Return type of static property 'previews' requires that 'TabMainView' conform to 'View'
 Static method 'buildBlock' requires that 'TabMainView' conform to 'View'
*/

//struct TabMainView_Previews: PreviewProvider {
//    static var previews: some View {
//        TabMainView()
//    }
//}
