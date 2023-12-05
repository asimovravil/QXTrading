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
        
        if #available(iOS 13.0, *) {
            let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = R.color.tabbarBackground()
            tabBar.standardAppearance = tabBarAppearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = tabBarAppearance
            }
        } else {
            tabBar.backgroundColor = R.color.tabbarBackground()
        }
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
