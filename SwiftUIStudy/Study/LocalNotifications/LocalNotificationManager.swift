//
//  LocalNotificationManager.swift
//  SwiftUIStudy
//
//  Created by 강대민 on 2023/04/28.
//

import Foundation
import NotificationCenter

//2. MainActor를 걸어준다.
@MainActor
class LocalNotificationManager: ObservableObject {
    //생성해준다.
    let notificationCenter = UNUserNotificationCenter.current()
    //알람요청 동의 확인
    @Published var isGranted = false
    
    //비동기적으로 구현해야한다.
    func requestAuthorization() async throws {
        try await notificationCenter
            .requestAuthorization(options: [.sound, .badge, .alert])
            await getCurrentSettings()
    }
    
    //1. 단순히 이렇게만하면 메인쓰레드에서 동작하는것을 보장할수없기때문에
    func getCurrentSettings() async {
        let currentSettings = await notificationCenter.notificationSettings()
        isGranted = (currentSettings.authorizationStatus == .authorized)
        print(isGranted)
    }
    
    //아래의 url은 알림설정 화면으로 넘어가게 해주는 url
    func openSettings() {
        if let url = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(url) {
                Task {
                    await UIApplication.shared.open(url)
                }
            }
        }
    }
    
    
}
