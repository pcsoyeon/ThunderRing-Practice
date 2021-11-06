//
//  CreateThunderVC.swift
//  Main
//
//  Created by soyeon on 2021/10/21.
//

import UIKit

class CreateThunderVC: UIViewController {
    
    // MARK: - UI
    
    private let closeButton = UIButton()
    
    private let groupSelectLabel = UILabel()
    private let thunderNameLabel = UILabel()
    
    private let thunderNameTextField = UITextField()
    private let detailTextView = UITextView()
    
    private let nameCountLabel = UILabel()
    private let detailCountLabel = UILabel()
    
    // MARK: - Properties
    
    private var count = 0

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initUI()
        setConstraints()
    }
}

extension CreateThunderVC {
    func initUI() {
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        groupSelectLabel.text = "그룹 선택"
        groupSelectLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        thunderNameLabel.text = "번개 이름"
        thunderNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        thunderNameTextField.placeholder = "번개 이름을 입력해주세요."
        thunderNameTextField.clearButtonMode = .whileEditing
        
        nameCountLabel.text = "0/\(count)"
        
        detailTextView.text = "세부 전달사항을 입력해주세요."
        detailTextView.textColor = .lightGray
    }
    
    func setConstraints() {
        view.addSubviews([closeButton,
                          groupSelectLabel,
                          thunderNameLabel, thunderNameTextField, nameCountLabel,
                          detailTextView, detailCountLabel])
        
        
    }
}
