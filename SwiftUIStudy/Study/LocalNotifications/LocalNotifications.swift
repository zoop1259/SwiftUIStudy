//
//  LocalNotifications.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/28.
//

import SwiftUI

struct LocalNotifications: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    //장면단계에서 파악.
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        NavigationView {
            VStack {
                //Manager에서 2번까지 진행해도 이 View에서는 isGranted의 값을 알 수 없어 요청을 하지 않기 때문에.
                if lnManager.isGranted {
                    GroupBox("Schedule") {
                        Button("Interval Notification") {
                            
                        }
                        .buttonStyle(.bordered)
                        Button("Calendar Notification") {
                            
                        }
                        .buttonStyle(.bordered)
                    }
                    .frame(width: 300)
                    // List View Here
                } else {
                    Button("Enable Notifications") {
                        //버튼을 누르면 알림설정 화면으로 넘어가짐.
                        lnManager.openSettings()
                    }
                }
                
            }
            .navigationTitle("Local Notifications")
        }
        .navigationViewStyle(.stack)
        .task {
            //초기 알람설정 요구.
            try? await lnManager.requestAuthorization()
        }
        //알람설정 on/off 파악.
        .onChange(of: scenePhase) { newValue in
            if newValue == .active {
                Task {
                    await lnManager.getCurrentSettings()
                }
            }
        }
    }
}

struct LocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotifications()
            .environmentObject(LocalNotificationManager())
    }
}

