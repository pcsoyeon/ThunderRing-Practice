//
//  ListTVC.swift
//  ChatUI
//
//  Created by soyeon on 2021/11/07.
//

import UIKit

class ListTVC: UITableViewCell {
    static let identifier = "ListTVC"

    @IBOutlet weak var backView: UIView!
    
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
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.gray.cgColor
        
        backView.layer.cornerRadius = 10
        backView.layer.masksToBounds = true
    }
}
