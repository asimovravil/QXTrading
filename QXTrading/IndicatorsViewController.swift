//
//  IndicatorsViewController.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit

class IndicatorsViewController: UIViewController {

    private let titleIndicator: UILabel = {
        let label = UILabel()
        label.text = "Bolinger Bands"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageIndicator: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.graphics()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionIndicator: UILabel = {
        let label = UILabel()
        label.text = "The Bollinger Bands indicator is a popular tool in technical analysis used to analyze price volatility and identify potential price reversal points. Developed by John Bollinger in the early 1980s, it consists of three bands – an upper band, a middle band, and a lower band. Here's how the Bollinger Bands work:"
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(titleIndicator)
        view.addSubview(imageIndicator)
        view.addSubview(descriptionIndicator)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        navigationBarSetup()
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            titleIndicator.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            imageIndicator.topAnchor.constraint(equalTo: titleIndicator.bottomAnchor, constant: 16),
            imageIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            descriptionIndicator.topAnchor.constraint(equalTo: imageIndicator.bottomAnchor, constant: 16),
            descriptionIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionIndicator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        navigationItem.leftBarButtonItems = []
        navigationItem.rightBarButtonItem = settingsButton

        let titleLabel = UILabel()
        titleLabel.text = "Indicators"
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
