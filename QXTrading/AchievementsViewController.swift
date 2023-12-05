//
//  AchievementsViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class AchievementsViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let imageAchivies: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.achivies()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageAchivies)
        view.backgroundColor = R.color.background()
        constraintsSetup()
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            imageAchivies.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            imageAchivies.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            imageAchivies.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            imageAchivies.heightAnchor.constraint(equalToConstant: 524),
            imageAchivies.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -24)
        ])
    }
}
