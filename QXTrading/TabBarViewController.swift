//
//  TabBarViewController.swift
//  QXTrading
//
//  Created by Ravil on 02.12.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addedTabBarSetup()
    }
        
    private func addedTabBarSetup() {
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        let profileViewController = UINavigationController(rootViewController: ProfileViewController())
        
        tabBar.backgroundColor = R.color.tabbarBackground()
        tabBar.tintColor = R.color.tabBarTint()
        tabBar.unselectedItemTintColor = .white
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "", image: R.image.tabHomeNon(),
            selectedImage: R.image.tabHome()
        )

        profileViewController.tabBarItem = UITabBarItem(
            title: "", image: R.image.tabProfileNon(),
            selectedImage: R.image.tabProfile()
        )
        
        viewControllers = [homeViewController, profileViewController]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}
