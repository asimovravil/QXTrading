//
//  ResultViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    var questionResults: [Bool] = []
    
    var percentComplete = 0
    var correctAnswers: Int = 0
    var totalQuestions: Int = 0
    
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
        
        circularProgressBar.progressBarMode = .percentageBased
        circularProgressBar.setProgressWithAnimation(duration: 1, value: percentComplete)
        
        updateUIWithResults(correctAnswers: correctAnswers, totalQuestions: totalQuestions)
    }
    
    func updateUIWithResults(correctAnswers: Int, totalQuestions: Int) {
        let percentage = totalQuestions > 0 ? (correctAnswers * 100) / totalQuestions : 0
        circularPercent.text = "\(percentage)%"
        circularAmountLabel.text = "\(correctAnswers)/\(totalQuestions)"
        circularProgressBar.setProgressWithAnimation(duration: 1, value: percentage)
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
        let topImageViews = [top1, top2, top3, top4, top5]
        
        for (index, imageView) in topImageViews.enumerated() {
            let imageName = index < questionResults.count && questionResults[index] ? "arrowCorrect" : "arrowIncorrect"
            let arrowImageView = UIImageView(image: UIImage(named: imageName))
            arrowImageView.translatesAutoresizingMaskIntoConstraints = false
            arrowImageView.contentMode = .scaleAspectFit
            imageView.addSubview(arrowImageView)
            
            NSLayoutConstraint.activate([
                arrowImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -5),
                arrowImageView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
                arrowImageView.widthAnchor.constraint(equalToConstant: 24),
                arrowImageView.heightAnchor.constraint(equalToConstant: 24)
            ])
        }
    }
    
    @objc func homeButtonMetod() {
        let tabBarVC = TabBarViewController()
        
        // Retrieve the UINavigationController and then get HomeViewController
        if let navigationController = tabBarVC.viewControllers?.first as? UINavigationController,
           let homeVC = navigationController.viewControllers.first as? HomeViewController {
            
            homeVC.correctAnswers = correctAnswers
            
            // Use UIWindowScene to get the window
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                  let window = windowScene.windows.first(where: { $0.isKeyWindow }) else {
                print("Error: Key Window not found")
                return
            }
            
            window.rootViewController = tabBarVC
            window.makeKeyAndVisible()
            
            UIView.transition(with: window, duration: 0.3, options: .transitionCrossDissolve, animations: {
                // Update UI based on correctAnswers
                if homeVC.correctAnswers > 3 {
                    homeVC.popWellDoneImage.isHidden = false
                    homeVC.popWellDoneButton.isHidden = false
                    homeVC.popPassTheTestImage.isHidden = true
                    homeVC.remindLaterButton.isHidden = true
                    homeVC.startTestButton.isHidden = true
                } else {
                    homeVC.popWellDoneImage.isHidden = true
                    homeVC.popWellDoneButton.isHidden = true
                    homeVC.popPassTheTestImage.isHidden = false
                    homeVC.remindLaterButton.isHidden = false
                    homeVC.startTestButton.isHidden = false
                }
            })
        } else {
            print("Error: HomeViewController not found")
        }
    }
    
}

