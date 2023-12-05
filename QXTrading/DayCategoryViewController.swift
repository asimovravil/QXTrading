//
//  DayCategoryViewController.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit
import StoreKit

class DayCategoryViewController: UIViewController {

    var selectedIndicatorIndex: Int = 0
    
    var isCircle1Success: Bool = false {
        didSet {
            circleCategory1Metod()
        }
    }
    
    var isCircle2Success: Bool = false {
        didSet {
            circleCategory2Metod()
        }
    }
    
    var isCircle3Success: Bool = false {
        didSet {
            circleCategory3Metod()
        }
    }
    
    var selectedDay: Int = 0
    
    private let circleCategory1: UIButton = {
        let button = UIButton()
        button.setImage(R.image.circleCategory(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let circleCategory2: UIButton = {
        let button = UIButton()
        button.setImage(R.image.circleCategory(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let circleCategory3: UIButton = {
        let button = UIButton()
        button.setImage(R.image.circleCategory(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let category1: UIButton = {
        let button = UIButton()
        button.setImage(R.image.category1(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let category2: UIButton = {
        let button = UIButton()
        button.setImage(R.image.category2(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let category3: UIButton = {
        let button = UIButton()
        button.setImage(R.image.category3(), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let category4: UIButton = {
        let button = UIButton()
        button.setImage(R.image.category4(), for: .normal)
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
        view.addSubview(category1)
        view.addSubview(category2)
        view.addSubview(category3)
        view.addSubview(category4)
        view.addSubview(toggleButonSwitch)
        view.addSubview(circleCategory1)
        view.addSubview(circleCategory2)
        view.addSubview(circleCategory3)
        constraintsSetup()
        navigationBarSetup()
        
        category1.addTarget(self, action: #selector(indicatorMetod), for: .touchUpInside)
        category3.addTarget(self, action: #selector(glossaryMetod), for: .touchUpInside)
        
        circleCategory1.addTarget(self, action: #selector(updateCircle1), for: .touchUpInside)
        circleCategory2.addTarget(self, action: #selector(updateCircle2), for: .touchUpInside)
        circleCategory3.addTarget(self, action: #selector(updateCircle3), for: .touchUpInside)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            category1.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            category1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleCategory1.trailingAnchor.constraint(equalTo: category1.trailingAnchor, constant: -16),
            circleCategory1.centerYAnchor.constraint(equalTo: category1.centerYAnchor),
            
            category2.topAnchor.constraint(equalTo: category1.bottomAnchor, constant: 24),
            category2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleCategory2.trailingAnchor.constraint(equalTo: category2.trailingAnchor, constant: -16),
            circleCategory2.centerYAnchor.constraint(equalTo: category2.centerYAnchor),

            category3.topAnchor.constraint(equalTo: category2.bottomAnchor, constant: 24),
            category3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleCategory3.trailingAnchor.constraint(equalTo: category3.trailingAnchor, constant: -16),
            circleCategory3.centerYAnchor.constraint(equalTo: category3.centerYAnchor),
            
            category4.topAnchor.constraint(equalTo: category3.bottomAnchor, constant: 24),
            category4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func navigationBarSetup() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let settingsButton = UIBarButtonItem(image: R.image.settingsBar(), style: .plain, target: self, action: #selector(settingsButtonTapped))
        settingsButton.tintColor = .white
        navigationItem.leftBarButtonItems = [] 
        navigationItem.rightBarButtonItem = settingsButton

        let titleLabel = UILabel()
        titleLabel.text = "Day \(selectedDay)"
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
    
    @objc func circleCategory1Metod() {
        let imageName = isCircle1Success ? "circleSuccess" : "circleCategory"
        let image = UIImage(named: imageName)
        circleCategory1.setImage(image, for: .normal)
    }
    
    @objc func circleCategory2Metod() {
        let imageName = isCircle2Success ? "circleSuccess" : "circleCategory"
        let image = UIImage(named: imageName)
        circleCategory2.setImage(image, for: .normal)
    }
    
    @objc func circleCategory3Metod() {
        let imageName = isCircle3Success ? "circleSuccess" : "circleCategory"
        let image = UIImage(named: imageName)
        circleCategory3.setImage(image, for: .normal)
    }
    
    @objc func updateCircle1() {
        isCircle1Success.toggle()
    }
    
    @objc func updateCircle2() {
        isCircle2Success.toggle()
    }
    
    @objc func updateCircle3() {
        isCircle3Success.toggle()
    }
    
    @objc func indicatorMetod() {
        let indicatorsVC = IndicatorsViewController()
        let index = selectedIndicatorIndex 
        let selectedIndicator = indicatorList[index]
        indicatorsVC.indicator = selectedIndicator
        self.navigationController?.pushViewController(indicatorsVC, animated: true)
    }
    
    @objc func glossaryMetod() {
        let controller = GlossaryViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
