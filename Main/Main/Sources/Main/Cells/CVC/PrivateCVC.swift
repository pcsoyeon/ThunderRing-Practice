//
//  PrivateCVC.swift
//  Main
//
//  Created by soyeon on 2021/10/24.
//

import UIKit

class PrivateCVC: UICollectionViewCell {
    static let identifier = "PrivateCVC"
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var groupListTableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTableView()
    }

}

extension PrivateCVC {
    func setTableView() {
        groupListTableView.delegate = self
        groupListTableView.dataSource = self
        
        let nib = UINib(nibName: PrivateInTVC.identifier, bundle: nil)
        groupListTableView.register(nib, forCellReuseIdentifier: PrivateInTVC.identifier)
        
        groupListTableView.layer.masksToBounds = true
        groupListTableView.layer.cornerRadius = 15
        groupListTableView.layer.borderWidth = 1
        groupListTableView.layer.borderColor = UIColor.gray.cgColor
    }
}

extension PrivateCVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 2
    }
}

extension PrivateCVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PrivateInTVC.identifier) as? PrivateInTVC else { return UITableViewCell() }
        return cell
    }
}
