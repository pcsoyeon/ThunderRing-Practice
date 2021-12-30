//
//  QuestionTVC.swift
//  TendencyTest
//
//  Created by soyeon on 2021/12/27.
//

import UIKit

class QuestionTVC: UITableViewCell {
    static let identifier = "QuestionTVC"
    
    // MARK: - UI
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: - Life Cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Setup Methods
    private func setupLayout() {
        self.addSubview(questionLabel)
        
        NSLayoutConstraint.activate([
            questionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            questionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func configUI() {
        self.backgroundColor = .systemBackground
    }
    
    // MARK: - Public Methods
    public func initCell(data: TendencyQuestionData) {
        questionLabel.text = data.question
    }

}
