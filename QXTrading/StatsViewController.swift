//
//  StatsViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class StatsViewController: UIViewController {

    private let cardAccount: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = R.color.colorTextField()
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
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
    
    private let labelTestResults: UILabel = {
        let label = UILabel()
        label.text = "Test Results"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(cardAccount)
        view.addSubview(imageResult)
        view.addSubview(labelResult)
        view.addSubview(subLabelResult)
        view.addSubview(circularProgressBar)
        view.addSubview(circularLabel)
        view.addSubview(circularDaysLabel)
        view.addSubview(labelTestResults)
        view.backgroundColor = R.color.background()
        constraintsSetup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cardAccount.layer.cornerRadius = 20
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cardAccount.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            cardAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardAccount.heightAnchor.constraint(equalToConstant: 114),
            
            imageResult.leadingAnchor.constraint(equalTo: cardAccount.leadingAnchor, constant: 16),
            imageResult.centerYAnchor.constraint(equalTo: cardAccount.centerYAnchor),
            
            labelResult.topAnchor.constraint(equalTo: imageResult.topAnchor, constant: -9),
            labelResult.leadingAnchor.constraint(equalTo: imageResult.trailingAnchor, constant: 19),
            
            subLabelResult.topAnchor.constraint(equalTo: labelResult.bottomAnchor),
            subLabelResult.leadingAnchor.constraint(equalTo: imageResult.trailingAnchor, constant: 19),
            
            circularProgressBar.trailingAnchor.constraint(equalTo: cardAccount.trailingAnchor, constant: -16),
            circularProgressBar.centerYAnchor.constraint(equalTo: cardAccount.centerYAnchor),
            circularProgressBar.widthAnchor.constraint(equalToConstant: 90),
            circularProgressBar.heightAnchor.constraint(equalToConstant: 90),
            
            circularLabel.topAnchor.constraint(equalTo: circularProgressBar.topAnchor, constant: 24),
            circularLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
            
            circularDaysLabel.topAnchor.constraint(equalTo: circularLabel.bottomAnchor),
            circularDaysLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
            
            labelTestResults.topAnchor.constraint(equalTo: cardAccount.bottomAnchor, constant: 24),
            labelTestResults.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}
