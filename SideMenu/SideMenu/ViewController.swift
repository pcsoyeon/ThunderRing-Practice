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
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    // MARK: - Properties
    
    private lazy var slideInMenuPadding: CGFloat = self.view.frame.width * 0.30
    private lazy var isSlideInMenuPresented = false

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        self.title = "Side Menu"
        self.navigationItem.setRightBarButton(menuBarButtonItem, animated: false)
        
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

public extension UIView {
    func edgeTo(_ view: UIView) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func pinMenuTo(_ view: UIView, with constant: CGFloat) {
        view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

