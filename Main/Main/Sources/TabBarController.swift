//
//  TabBarController.swift
//  Main
//
//  Created by soyeon on 2021/10/18.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBlue
        
        let mainTab =  UINavigationController(rootViewController: ViewController())
        mainTab.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let tabs =  [mainTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = mainTab
    }
    
}
