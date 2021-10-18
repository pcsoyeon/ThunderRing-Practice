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
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainTab = mainStoryboard.instantiateViewController(identifier: "NaviController")
        
        let tabs =  [mainTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = mainTab
    }
}
