//
//  SettingsViewController.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController {

    private let settings1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.settings1()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let settings2: UIButton = {
        let button = UIButton()
        button.setImage(R.image.settings2(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settings3: UIButton = {
        let button = UIButton()
        button.setImage(R.image.settings3(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let settings4: UIButton = {
        let button = UIButton()
        button.setImage(R.image.settings4(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let toggleButonSwitch: UISwitch = {
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(true, animated: true)
        switchView.translatesAutoresizingMaskIntoConstraints = false
        return switchView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = R.color.background()
        view.addSubview(settings1)
        view.addSubview(settings2)
        view.addSubview(settings3)
        view.addSubview(settings4)
        view.addSubview(toggleButonSwitch)
        constraintsSetup()
        navigationBarSetup()
        
        toggleButonSwitch.addTarget(self, action: #selector(switchTon(_:)), for: .valueChanged)
        settings2.addTarget(self, action: #selector(settings2Metod), for: .touchUpInside)
        settings3.addTarget(self, action: #selector(settings3Metod), for: .touchUpInside)
        settings4.addTarget(self, action: #selector(settings4Metod), for: .touchUpInside)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            settings1.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            settings1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings2.topAnchor.constraint(equalTo: settings1.bottomAnchor, constant: 16),
            settings2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            settings3.topAnchor.constraint(equalTo: settings2.bottomAnchor, constant: 16),
            settings3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            settings4.topAnchor.constraint(equalTo: settings3.bottomAnchor, constant: 16),
            settings4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            toggleButonSwitch.trailingAnchor.constraint(equalTo: settings1.trailingAnchor, constant: -16),
            toggleButonSwitch.centerYAnchor.constraint(equalTo: settings1.centerYAnchor),
        ])
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let closeButton = UIBarButtonItem(image: R.image.closeBarClose(), style: .plain, target: self, action: #selector(closeButtonTapped))
        closeButton.tintColor = .white
        navigationItem.rightBarButtonItem = closeButton
        
        let titleLabel = UILabel()
        titleLabel.text = "Settings"
        titleLabel.textColor = .white
        titleLabel.font = R.font.ibmPlexSansBold(size: 24)
        navigationItem.titleView = titleLabel

        navigationController?.navigationBar.shadowImage = UIImage()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = R.color.background()
        
        let borderBottom = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 0.5))
        borderBottom.backgroundColor = R.color.settingsLineColor()
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
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func settings2Metod() {
        let textToShare = "Check out this awesome app!"
        let appURL = URL(string: "https://www.yourappstorelink.com")!
        
        let activityViewController = UIActivityViewController(activityItems: [textToShare, appURL], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    @objc func settings3Metod() {
        SKStoreReviewController.requestReview()
    }
    
    @objc func settings4Metod() {
        let controller = PrivacyController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func switchTon(_ sender : UISwitch){
        if sender.isOn {
            print("On")
        } else {
            print("No")
        }
    }
}
