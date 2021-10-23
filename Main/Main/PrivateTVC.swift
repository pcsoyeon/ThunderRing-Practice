//
//  PrivateTVC.swift
//  Main
//
//  Created by soyeon on 2021/10/18.
//

import UIKit

class PrivateTVC: UITableViewCell {
    static let identifier = "PrivateTVC"

    // MARK: - UI
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBOutlet weak var seeAllButton: UIButton!
    
    @IBOutlet weak var groupCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var count = 0
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension PrivateTVC {
    func initUI() {
        titleLabel.text = "비공개 그룹"
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        countLabel.text = "\(count)"
        countLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        countLabel.textColor = .gray
        
        seeAllButton.setTitle("전체 보기", for: .normal)
        seeAllButton.setTitleColor(.gray, for: .normal)
        seeAllButton.backgroundColor = .white
        seeAllButton.layer.borderColor = UIColor.gray.cgColor
        seeAllButton.layer.borderWidth = 1
        seeAllButton.layer.cornerRadius = 15
        seeAllButton.layer.masksToBounds = true
        seeAllButton.addAction(UIAction(handler: { _ in
            NotificationCenter.default.post(name: NSNotification.Name("touchUpSeeAll"), object: nil)
        }), for: .touchUpInside)
    }
    
    func setCollectionView() {
        
    }
}

extension PrivateTVC: UICollectionViewDelegateFlowLayout {
    
}

extension PrivateTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
