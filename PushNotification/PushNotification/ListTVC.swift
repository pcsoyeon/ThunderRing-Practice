//
//  ListTVC.swift
//  PushNotification
//
//  Created by soyeon on 2021/10/16.
//

import UIKit

class ListTVC: UITableViewCell {
    static let identifier = "ListTVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension ListTVC {
    func initUI() {
        nameLabel.font = .systemFont(ofSize: 18, weight: .regular)
        nameLabel.textColor = .systemPink
    }
    
    func initCell(name: String) {
        self.nameLabel.text = name
    }
}
