//
//  LocalNotificationManager.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/28.
//

import Foundation
import NotificationCenter

class LocalNotificationManager: ObservableObject {
    //생성해준다.
    let notificationCenter = UNUserNotificationCenter.current()
    
    //비동기적으로 구현해야한다.
    func requestAuthorization() async throws {
         try await notificationCenter
            .requestAuthorization(options: [.sound, .badge, .alert])
    }
    
    
    
}
