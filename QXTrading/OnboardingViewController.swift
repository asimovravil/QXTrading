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
        label.font = UIFont(name: "IBMPlexSans-SemiBold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var onboSubLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 0
        label.alpha = 0.80
        label.font = UIFont(name: "IBMPlexSans-Regular", size: 16)
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
        button.setImage(UIImage(named: "startLearning"), for: .normal)
        button.addTarget(self, action: #selector(onboButtonNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        view.addSubview(onboImage)
        view.addSubview(onboLabel)
        view.addSubview(onboSubLabel)
        view.addSubview(onboPageControll)
        view.addSubview(onboButton)
        
        constraintsSetup()
        updateOnbo(onboCurrentPage)
    }
    
    func updateOnbo(_ onboList: Int) {
        let onboList = onbo[onboList]
        onboLabel.text = onboList.textTitle
        onboSubLabel.text = onboList.textSubTitle
        onboImage.image = UIImage(named: onboList.imageName)
    }
    
    @objc func onboButtonNext() {
        if onboCurrentPage < onbo.count - 1 {
            onboCurrentPage += 1
        } else {
            print("good")
        }
        
        updateOnbo(onboCurrentPage)
        onboPageControll.currentPage = onboCurrentPage
        
        if onboCurrentPage == onbo.count - 1 {
            onboButton.setImage(UIImage(named: "startLearning"), for: .normal)
        } else {
            onboButton.setImage(UIImage(named: "letsGetStarted"), for: .normal)
        }
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
        ])
    }
}

