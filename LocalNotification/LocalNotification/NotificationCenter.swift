//
//  NotificationCenter.swift
//  LocalNotification
//
//  Created by soyeon on 2021/11/17.
//

import Foundation
import UserNotifications

class NotificationCenter {
    static let shared = NotificationCenter()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func userRequest() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
            
        notificationCenter.requestAuthorization(options: options) {
            (granted, error) in
            print("granted NotificationCenter : \(granted)")
        }
    }
    
    func generateNotification(){
        notificationCenter.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                
                content.title = "⚡️ SO KYTE ⚡️"
                content.subtitle = "뭘 봐."
                content.body = "왜 사람은 일을 해야 하는걸까?\n노력 없이 성과를 바라면 안되는거야?"
                content.sound = UNNotificationSound.default
                content.badge = 1
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
                let identifier = "SO KYTE"
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                
                self.notificationCenter.add(request) { (error) in
                    if let err = error {
                        print(err.localizedDescription)
                    }
                }
            } else {
                // 알림 동의하지 않은 경우
            }
            
        }
    }
    
}
