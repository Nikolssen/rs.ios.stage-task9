//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Admin
// On: 29.07.2021
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.red
        
        let itemsVC = ItemsViewController()
        
        itemsVC.tabBarItem.title = "Items"
        itemsVC.tabBarItem.image = UIImage("menu")

        let settingsVC = SettingsViewController()
        
        settingsVC.colorSetter = { [weak itemsVC] color in
            itemsVC?.color = color
        }
        settingsVC.shouldAnimateSetter = {
            [weak itemsVC] shouldAnimate in
            itemsVC?.shouldAnimate = shouldAnimate
        }
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        settingsNav.tabBarItem.title = "Settings"
        settingsNav.tabBarItem.image = UIImage("gear")
        
        
        viewControllers = [itemsVC, settingsNav]
    }
    

}
