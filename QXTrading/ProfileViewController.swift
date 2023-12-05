//
//  ProfileViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.accountImageCard()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let profileLabel: UILabel = {
        let label = UILabel()
        label.text = "Unknown"
        label.textAlignment = .center
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let profileEditButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.editProfile(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.background()
        
        view.addSubview(profileImage)
        view.addSubview(profileLabel)
        view.addSubview(profileEditButton)
        
        profileEditButton.addTarget(self, action: #selector(profileEditButtonMetod), for: .touchUpInside)
        
        constraintsSetup()
        navigationBarSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImage.layer.cornerRadius = 30
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let imageView = UIImageView(image: R.image.quotex())
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        navigationItem.leftBarButtonItems = [UIBarButtonItem(customView: imageView), flexibleSpace]
        navigationItem.rightBarButtonItem = settingsButton
        
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
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            profileImage.heightAnchor.constraint(equalToConstant: 60),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileLabel.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            profileLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            profileEditButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            profileEditButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc func profileEditButtonMetod() {
        let controller = EditProfileViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
