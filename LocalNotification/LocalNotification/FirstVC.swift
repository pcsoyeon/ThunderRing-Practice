//
//  FirstVC.swift
//  LocalNotification
//
//  Created by soyeon on 2021/11/17.
//

import UIKit

class FirstVC: UIViewController {
    
    let notification = NotificationCenter.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchUpPushButton(_ sender: Any) {
        notification.generateNotification()
    }
    
}
