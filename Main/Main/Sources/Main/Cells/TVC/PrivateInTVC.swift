//
//  PrivateInTVC.swift
//  Main
//
//  Created by soyeon on 2021/10/24.
//

import UIKit

class PrivateInTVC: UITableViewCell {
    static let identifier = "PrivateInTVC"

    // MARK: - IB Outlets
    
    @IBOutlet weak var createButton: UIButton!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PrivateInTVC {
    func initUI() {
        createButton.setTitle("번개 보내기", for: .normal)
        createButton.addAction(UIAction(handler: { _ in
            NotificationCenter.default.post(name: NSNotification.Name("TouchUpCreateThunder"), object: nil)
        }), for: .touchUpInside)
    }
}
