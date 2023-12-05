//
//  PatternsViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class PatternsViewController: UIViewController {

    var pattern: Patterns?
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let titlePattern: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imagePattern: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionPattern: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(titlePattern)
        scrollView.addSubview(imagePattern)
        scrollView.addSubview(descriptionPattern)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        navigationBarSetup()
        
        if let pattern = pattern {
            titlePattern.text = pattern.titlePat
            imagePattern.image = UIImage(named: pattern.imageNamePat)
            descriptionPattern.text = pattern.descriptionPat
        }
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            titlePattern.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 24),
            titlePattern.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            titlePattern.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),

            imagePattern.topAnchor.constraint(equalTo: titlePattern.bottomAnchor, constant: 16),
            imagePattern.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            imagePattern.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            imagePattern.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            imagePattern.heightAnchor.constraint(equalToConstant: 485),

            descriptionPattern.topAnchor.constraint(equalTo: imagePattern.bottomAnchor, constant: 16),
            descriptionPattern.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            descriptionPattern.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            descriptionPattern.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            descriptionPattern.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItem = settingsButton

        let titleLabel = UILabel()
        titleLabel.text = "Patterns"
        titleLabel.textColor = .white
        titleLabel.font = R.font.ibmPlexSans(size: 16)
        navigationItem.titleView = titleLabel

        navigationController?.navigationBar.shadowImage = UIImage()

        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = R.color.background()

        let borderBottom = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1))
        borderBottom.backgroundColor = R.color.colorShadowBottomNavBar()
        borderBottom.translatesAutoresizingMaskIntoConstraints = false

        navigationController?.navigationBar.layoutIfNeeded()
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.addSubview(borderBottom)

            NSLayoutConstraint.activate([
                borderBottom.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
                borderBottom.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
                borderBottom.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
                borderBottom.heightAnchor.constraint(equalToConstant: 1)
            ])

            navigationBar.standardAppearance = navBarAppearance
            navigationBar.compactAppearance = navBarAppearance
            navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
    
    @objc private func settingsButtonTapped() {
        let settingsVC = UINavigationController(rootViewController: SettingsViewController())
        self.present(settingsVC, animated: true, completion: nil)
    }
}
