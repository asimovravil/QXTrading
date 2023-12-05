//
//  SceneDelegate.swift
//  QXTrading
//
//  Created by Ravil on 30.11.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var navigation: UINavigationController!
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        window?.overrideUserInterfaceStyle = .dark
        window?.rootViewController = LololoViewController()
        window?.makeKeyAndVisible()
    
        KhinkaliViewController.shared.request { [weak self] url in
            if let url = url {
                self?.window?.rootViewController = WKNavigationBurgerApp(url: url)
            } else {
                if !UIKitAppStore.isOnboardingShowed {
                    self?.navigation = UINavigationController(
                        rootViewController: OnboardingViewController()
                    )
                }
                self?.window?.rootViewController = self?.navigation
            }
        }
    }
}

