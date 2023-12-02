//
//  HomeViewController.swift
//  QXTrading
//
//  Created by Ravil on 01.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
        navigationBarSetup()
    }
    
    private func navigationBarSetup() {
        let imageView = UIImageView(image: R.image.quotex())
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: nil, action: nil)
        settingsButton.tintColor = .white
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: imageView), flexibleSpace]
        navigationItem.rightBarButtonItem = settingsButton
        
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = .black
        
        let borderBottom = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        borderBottom.backgroundColor = R.color.colorShadowBottomNavBar()
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        
        navigationController?.navigationBar.layoutIfNeeded()
        navigationController?.navigationBar.addSubview(borderBottom)
        
        NSLayoutConstraint.activate([
            borderBottom.leadingAnchor.constraint(equalTo: navigationController!.navigationBar.leadingAnchor),
            borderBottom.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: navigationController!.navigationBar.bottomAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
