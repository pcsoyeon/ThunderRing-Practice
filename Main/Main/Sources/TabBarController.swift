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
        
        UITabBar.appearance().tintColor = .systemPurple
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainTab = mainStoryboard.instantiateViewController(identifier: "NaviController")
        mainTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let otherTab = CreateThunderVC()
        otherTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "heart"), selectedImage: UIImage(systemName: "heart.fill"))
        
        let tabs =  [mainTab, otherTab]
        
        setViewControllers(tabs, animated: false)
        selectedViewController = mainTab
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let itemView = item.value(forKey: "view") as? UIView else { return }
        let itemAnimator = UIViewPropertyAnimator(duration: 0.1, dampingRatio: 0.5) {
            itemView.transform = CGAffineTransform.identity.scaledBy(x: 1.2, y: 1.2)
        }
        
        itemAnimator.addAnimations({itemView.transform = .identity },delayFactor: 0.5)
        itemAnimator.startAnimation()
    }
    
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
