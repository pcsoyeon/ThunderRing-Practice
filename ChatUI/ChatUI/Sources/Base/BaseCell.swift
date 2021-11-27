//
//  BaseCell.swift
//  ChatUI
//
//  Created by soyeon on 2021/11/27.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupViews() {
        
    }
}
