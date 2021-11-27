//
//  ContactTVC.swift
//  ContactsCRUD
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class ContactTVC: UITableViewCell {
    static let identifier = "ContactTVC"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var selectButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}


