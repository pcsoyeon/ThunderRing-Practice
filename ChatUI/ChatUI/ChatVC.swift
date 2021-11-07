//
//  ChatVC.swift
//  ChatUI
//
//  Created by soyeon on 2021/11/07.
//

import UIKit

class ChatVC: UIViewController {

    // MARK: - UI
    
    @IBOutlet weak var alarmView: UIView!
    @IBOutlet weak var alarmLabel: UILabel!
    
    @IBOutlet weak var chatTableView: UITableView!
    
    // MARK: - Properties
    
    private var endTime = Date()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        
        setTableView()
    }
}

extension ChatVC {
    func initUI() {
        alarmView.backgroundColor = .white
        
        alarmLabel.text = "펑 시각 \(endTime)"
        alarmLabel.textColor = .gray
        alarmLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    }
    
    func setTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        let nib = UINib(nibName: ChatTVC.identifier, bundle: nil)
        chatTableView.register(nib, forCellReuseIdentifier: ChatTVC.identifier)
    }
}

extension ChatVC: UITableViewDelegate {
    
}

extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatTVC.identifier) as? ChatTVC else { return UITableViewCell() }
        return cell
    }
}
