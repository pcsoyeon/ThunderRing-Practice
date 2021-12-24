//
//  ViewController.swift
//  SideMenu
//
//  Created by soyeon on 2021/12/18.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UI
    
    private lazy var menuBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "sidebar.leading")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(touchUpMenuBarButton))
    
    private lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setTitle("채팅방 이름 변경하기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var exitButton: UIButton = {
        let button = UIButton()
        button.setTitle("채팅방 나가기", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    // MARK: - Properties
    
    private lazy var slideInMenuPadding: CGFloat = self.view.frame.width * 0.42
    private lazy var isSlideInMenuPresented = false

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        configUI()
    }
    
    // MARK: - Set Up Methods
    
    private func setupLayout() {
        [editButton, exitButton].forEach {
            menuView.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            editButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 25),
            editButton.topAnchor.constraint(equalTo: menuView.topAnchor, constant: 25),
            
            exitButton.leadingAnchor.constraint(equalTo: menuView.leadingAnchor, constant: 25),
            exitButton.topAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 7)
        ])
    }
    
    private func configUI() {
        view.backgroundColor = .systemBackground
        title = "Side Menu"
        navigationItem.setRightBarButton(menuBarButtonItem, animated: false)
        
        menuView.pinMenuTo(view, with: slideInMenuPadding)
        containerView.edgeTo(view)
    }

    // MARK: - @objc
    
    @objc
    func touchUpMenuBarButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.containerView.frame.origin.x = self.isSlideInMenuPresented ?  self.slideInMenuPadding : -self.containerView.frame.width
        } completion: { (finished) in
            self.isSlideInMenuPresented.toggle()
        }

    }
}


