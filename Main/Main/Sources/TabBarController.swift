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
        
        self.delegate = self
        
        UITabBar.appearance().tintColor = .systemPurple
        UITabBar.clearShadow()
        tabBar.layer.applyShadow(color: .gray, alpha: 0.3, x: 0, y: 0, blur: 12)
        
        let mainStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let mainTab = mainStoryboard.instantiateViewController(identifier: "NaviController")
        mainTab.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let thunderTab = CreateThunderVC()
        thunderTab.tabBarItem = UITabBarItem(title: "번개", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let otherTab = OtherVC()
        otherTab.tabBarItem = UITabBarItem(title: "other", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        
        let tabs =  [mainTab, thunderTab, otherTab]
        
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

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is CreateThunderVC {
            let dvc = CreateThunderVC()
            dvc.modalPresentationStyle = .fullScreen
            tabBarController.present(dvc, animated: true, completion: nil)
            return false
        }
        return true
    }
}

extension UITabBar {
    static func clearShadow() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}
