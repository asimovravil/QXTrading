//
//  OnboardingViewController.swift
//  QXTrading
//
//  Created by Ravil on 30.11.2023.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    var onboCurrentPage = 0

    private let onboImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    var onboLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansSemiBold(size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var onboSubLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.alpha = 0.80
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let onboPageControll: UIPageControl = {
        let pageControll = UIPageControl()
        pageControll.numberOfPages = onbo.count
        pageControll.currentPageIndicatorTintColor = .green
        pageControll.translatesAutoresizingMaskIntoConstraints = false
        return pageControll
    }()
    
    private let onboButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let accountButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.accountCamera(), for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let accountTextField: UITextField = {
        let textField = UITextField()
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white.withAlphaComponent(0.50),
            NSAttributedString.Key.font: R.font.ibmPlexSansMedium(size: 24)!
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Your Name", attributes: attributes)
        textField.font = R.font.ibmPlexSansMedium(size: 24)
        textField.textAlignment = .center
        textField.borderStyle = .none
        textField.textColor = .white
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.isHidden = true
        textField.backgroundColor = R.color.colorTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(onboImage)
        view.addSubview(onboLabel)
        view.addSubview(onboSubLabel)
        view.addSubview(onboPageControll)
        view.addSubview(onboButton)
        view.addSubview(accountButton)
        view.addSubview(accountTextField)
        
        onboButton.addTarget(self, action: #selector(onboButtonNext), for: .touchUpInside)
        
        constraintsSetup()
        updateOnbo(onboCurrentPage)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        accountTextField.layer.cornerRadius = 20
    }
    
    func updateOnbo(_ onboList: Int) {
        let onboItem = onbo[onboList]
        onboLabel.text = onboItem.textTitle
        onboSubLabel.text = onboItem.textSubTitle
        onboImage.image = UIImage(named: onboItem.imageName)

        switch onboList {
        case onbo.count - 1:
            onboButton.setImage(R.image.createAccount(), for: .normal)
            accountButton.isHidden = false
            accountTextField.isHidden = false
        case onbo.count - 2:
            onboButton.setImage(R.image.letsGetStarted(), for: .normal)
        default:
            onboButton.setImage(R.image.startLearning(), for: .normal)
        }
    }

    
    @objc func onboButtonNext() {
        if onboCurrentPage < onbo.count - 1 {
            onboCurrentPage += 1
        } else {
            print("good")
        }
        
        updateOnbo(onboCurrentPage)
        onboPageControll.currentPage = onboCurrentPage
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            onboImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            onboImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            onboLabel.bottomAnchor.constraint(equalTo: onboSubLabel.topAnchor, constant: -12),
            onboLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboSubLabel.bottomAnchor.constraint(equalTo: onboPageControll.topAnchor, constant: -32),
            onboSubLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            onboSubLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            onboPageControll.bottomAnchor.constraint(equalTo: onboButton.topAnchor, constant: -30),
            onboPageControll.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            onboButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -55),
            onboButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountButton.bottomAnchor.constraint(equalTo: accountTextField.topAnchor, constant: -32),
            accountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            accountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            accountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            accountTextField.bottomAnchor.constraint(equalTo: onboLabel.topAnchor, constant: -175),
            accountTextField.heightAnchor.constraint(equalToConstant: 63),
        ])
    }
}

