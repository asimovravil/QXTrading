//
//  ResultViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Test Result"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let circularProgressBar: CircularProgressBar = {
        let progressBar = CircularProgressBar(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        progressBar.lineWidth = 15
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        return progressBar
    }()
    
    private let circularPercent: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansBold(size: 64)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let circularAmountLabel: UILabel = {
        let label = UILabel()
        label.text = "1/5"
        label.textColor = .white
        label.alpha = 0.50
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let top1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.top1()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let top2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.top2()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let top3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.top3()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let top4: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.top4()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let top5: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.top5()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Well done, keep up the good work and learn something new about trading every day!"
        label.textColor = .white
        label.alpha = 0.80
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = R.font.ibmPlexSans(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let homeButton: UIButton = {
        let button = UIButton()
        button.setImage(R.image.home(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.color.background()
        view.addSubview(titleLabel)
        view.addSubview(circularProgressBar)
        view.addSubview(circularPercent)
        view.addSubview(circularAmountLabel)
        
        view.addSubview(stackView)
        
        view.addSubview(descriptionLabel)
        view.addSubview(homeButton)
        
        stackView.addArrangedSubview(top1)
        stackView.addArrangedSubview(top2)
        stackView.addArrangedSubview(top3)
        stackView.addArrangedSubview(top4)
        stackView.addArrangedSubview(top5)
        
        homeButton.addTarget(self, action: #selector(homeButtonMetod), for: .touchUpInside)

        constraintsSetup()
        addArrowCorrectImageToTopImages()
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            circularProgressBar.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 83),
            circularProgressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circularProgressBar.widthAnchor.constraint(equalToConstant: 250),
            circularProgressBar.heightAnchor.constraint(equalToConstant: 250),
            
            circularPercent.topAnchor.constraint(equalTo: circularProgressBar.topAnchor, constant: 70),
            circularPercent.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
            
            circularAmountLabel.topAnchor.constraint(equalTo: circularPercent.bottomAnchor),
            circularAmountLabel.centerXAnchor.constraint(equalTo: circularProgressBar.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: circularProgressBar.bottomAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            descriptionLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            homeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -72),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func addArrowCorrectImageToTopImages() {
        let arrowCorrectImage = UIImage(named: "arrowCorrect")
        
        let topImageViews = [top1, top2, top3, top4, top5]
        
        for imageView in topImageViews {
            let arrowCorrectImageView = UIImageView(image: arrowCorrectImage)
            arrowCorrectImageView.translatesAutoresizingMaskIntoConstraints = false
            arrowCorrectImageView.contentMode = .scaleAspectFit
            imageView.addSubview(arrowCorrectImageView)
            
            NSLayoutConstraint.activate([
                arrowCorrectImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
                arrowCorrectImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                arrowCorrectImageView.widthAnchor.constraint(equalToConstant: 24),
                arrowCorrectImageView.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
    }
    
    @objc func homeButtonMetod() {
        let tabBarVC = TabBarViewController()
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}
