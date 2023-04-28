//
//  LocalNotifications.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/28.
//

import SwiftUI

struct LocalNotifications: View {
    @EnvironmentObject var lnManager: LocalNotificationManager
    var body: some View {
        NavigationView {
            VStack {
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
                
                
            }
            .navigationTitle("Local Notifications")
        }
        .navigationViewStyle(.stack)
        .task {
            //알람설정 요구.
            try? await lnManager.requestAuthorization()
        }
    }
}

struct LocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        LocalNotifications()
            .environmentObject(LocalNotificationManager())
    }
}
