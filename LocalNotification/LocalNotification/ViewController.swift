//
//  ViewController.swift
//  LocalNotification
//
//  Created by soyeon on 2021/10/19.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var pushButton: UIButton!
    
    // MARK: - Properties
    
    let userNotiCenter = UNUserNotificationCenter.current()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestAuthNoti()
        requestSendNoti(seconds: 3)
    }
    
    // 사용자에게 알림 권한 요청
    private func requestAuthNoti() {
        let notiAuthOptions = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
        userNotiCenter.requestAuthorization(options: notiAuthOptions) { (success, error) in
            if let error = error {
                print(#function, error)
            }
        }
    }
    
    // 알림 전송
    private func requestSendNoti(seconds: Double) {
        let notiContent = UNMutableNotificationContent()
        notiContent.title = "알림 title"
        notiContent.body = "알림 body"
        notiContent.userInfo = ["targetScene": "splash"] // 푸시 받을때 오는 데이터
        
        // 알림이 trigger되는 시간 설정
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: notiContent,
            trigger: trigger
        )
        
        userNotiCenter.add(request) { (error) in
            print(#function, error)
        }
        
    }
    
    // MARK: - IB Actions
    
    @IBAction func touchUpPushButton(_ sender: Any) {
        let content = UNMutableNotificationContent()
                
        content.title = "썬더링"
        content.body = "하나 둘 셋 썬더링 화이팅"
        content.badge = 1

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: "timer", content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
}
