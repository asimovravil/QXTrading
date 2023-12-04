//
//  HomeViewController.swift
//  QXTrading
//
//  Created by Ravil on 01.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    private let cardAccount: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = R.color.colorTextField()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    private let imageAccount: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.accountImageCard()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelAccount: UILabel = {
        let label = UILabel()
        label.text = "Unknown"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageResult: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.resultCard()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let labelResult: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansBold(size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subLabelResult: UILabel = {
        let label = UILabel()
        label.text = "Test results"
        label.textColor = .white
        label.numberOfLines = 0
        label.alpha = 0.50
        label.font = R.font.ibmPlexSans(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circularProgressBar: CircularProgressBar = {
        let progressBar = CircularProgressBar(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let circularLabel: UILabel = {
        let label = UILabel()
        label.text = "1/30"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansBold(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circularDaysLabel: UILabel = {
        let label = UILabel()
        label.text = "days"
        label.textColor = .white
        label.alpha = 0.50
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let currentDay = 1

        view.addSubview(cardAccount)
        view.addSubview(imageAccount)
        view.addSubview(labelAccount)
        view.addSubview(imageResult)
        view.addSubview(labelResult)
        view.addSubview(subLabelResult)
        view.addSubview(circularLabel)
        view.addSubview(circularDaysLabel)
        cardAccount.addSubview(circularProgressBar)
        view.backgroundColor = .black
        constraintsSetup()
        navigationBarSetup()
        updateProgress(currentDay: currentDay, totalDays: 30)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cardAccount.layer.cornerRadius = 20
        imageAccount.layer.cornerRadius = 30
    }
    
    func formattedText(currentDay: Int, totalDays: Int) -> NSAttributedString {
        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: R.font.ibmPlexSansBold(size: 20) ?? UIFont.boldSystemFont(ofSize: 20)
        ]
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .font: R.font.ibmPlexSans(size: 12) ?? UIFont.systemFont(ofSize: 12)
        ]
        
        let boldText = NSAttributedString(string: "\(currentDay)", attributes: boldAttributes)
        let normalText = NSAttributedString(string: "/\(totalDays)", attributes: normalAttributes)
        
        let attributedText = NSMutableAttributedString()
        attributedText.append(boldText)
        attributedText.append(normalText)
        
        return attributedText
    }
    
    func updateProgress(currentDay: Int, totalDays: Int) {
        circularProgressBar.setProgressWithAnimation(duration: 1, currentDay: currentDay, totalDays: totalDays)
        circularLabel.attributedText = formattedText(currentDay: currentDay, totalDays: totalDays)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cardAccount.topAnchor.constraint(equalTo: view.topAnchor, constant: 131),
            cardAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardAccount.heightAnchor.constraint(equalToConstant: 178),
            
            imageAccount.topAnchor.constraint(equalTo: cardAccount.topAnchor, constant: 12),
            imageAccount.leadingAnchor.constraint(equalTo: cardAccount.leadingAnchor, constant: 16),
            
            labelAccount.centerYAnchor.constraint(equalTo: imageAccount.centerYAnchor),
            labelAccount.leadingAnchor.constraint(equalTo: imageAccount.trailingAnchor, constant: 16),
            
            imageResult.topAnchor.constraint(equalTo: imageAccount.bottomAnchor, constant: 29),
            imageResult.leadingAnchor.constraint(equalTo: cardAccount.leadingAnchor, constant: 16),
            
            labelResult.topAnchor.constraint(equalTo: imageAccount.bottomAnchor, constant: 20),
            labelResult.leadingAnchor.constraint(equalTo: imageResult.trailingAnchor, constant: 19),
            
            subLabelResult.topAnchor.constraint(equalTo: labelResult.bottomAnchor),
            subLabelResult.leadingAnchor.constraint(equalTo: imageResult.trailingAnchor, constant: 19),
            
            circularProgressBar.trailingAnchor.constraint(equalTo: cardAccount.trailingAnchor, constant: -16),
            circularProgressBar.bottomAnchor.constraint(equalTo: cardAccount.bottomAnchor, constant: -16),
            circularProgressBar.widthAnchor.constraint(equalToConstant: 90),
            circularProgressBar.heightAnchor.constraint(equalToConstant: 90),
            
            circularLabel.topAnchor.constraint(equalTo: circularProgressBar.topAnchor, constant: 24),
            circularLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
            
            circularDaysLabel.topAnchor.constraint(equalTo: circularLabel.bottomAnchor),
            circularDaysLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
        ])
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
            borderBottom.leadingAnchor.constraint(equalTo: (navigationController!.navigationBar.leadingAnchor)),
            borderBottom.trailingAnchor.constraint(equalTo: navigationController!.navigationBar.trailingAnchor),
            borderBottom.bottomAnchor.constraint(equalTo: navigationController!.navigationBar.bottomAnchor),
            borderBottom.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.compactAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}
