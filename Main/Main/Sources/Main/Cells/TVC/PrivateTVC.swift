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
    
    var cellDelegate: CellDelegate?
    
    // MARK: - Life Cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        initUI()
        setCollectionView()
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
//            NotificationCenter.default.post(name: NSNotification.Name("TouchUoSeeAll"), object: nil)
            let dvc = GroupListVC()
            self.cellDelegate?.touchUpSeeAll(dvc: dvc)
        }), for: .touchUpInside)
    }
    
    func setCollectionView() {
        let nib = UINib(nibName: PrivateCVC.identifier, bundle: nil)
        groupCollectionView.register(nib, forCellWithReuseIdentifier: PrivateCVC.identifier)
        
        groupCollectionView.delegate = self
        groupCollectionView.dataSource = self
    }
}

extension PrivateTVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = groupCollectionView.frame.width - 25 - 51 - 9
        let cellHeight = groupCollectionView.frame.height - 40
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 25, bottom: 5, right: 25)
    }
}

extension PrivateTVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrivateCVC.identifier, for: indexPath) as? PrivateCVC else { return UICollectionViewCell() }
        return cell
    }
}
