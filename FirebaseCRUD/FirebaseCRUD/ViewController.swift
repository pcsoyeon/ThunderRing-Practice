//
//  ViewController.swift
//  FirebaseCRUD
//
//  Created by soyeon on 2021/11/27.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    private let database = Database.database().reference()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.child("lightning1").observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String : Any] else {
                return 
            }
            print("Value: \(value)")
        }
        
        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width - 40, height: 50))
        button.setTitle("", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGray6
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
    }

    @objc
    private func addNewEntry() {
        let object: [String : Any] = [
            "그룹" : "양파링걸즈" as NSObject,
            "번개 이름" : "전통주마시자",
            "번개 간단 소개" : "느린마을 막걸리, 알밤 막걸리 모두 다 환영",
            "날짜" : "2021년 11월 28일",
            "시간" : "오후 8시",
            "장소" : "을지로 3가",
            "정원" : "2명~4명"
        ]
        database.child("lightning1").setValue(object)
    }

}

