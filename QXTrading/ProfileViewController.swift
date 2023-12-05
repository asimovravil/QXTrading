//
//  ProfileViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ProfileViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var pageViewController: UIPageViewController!
    var pageViewControllers: [UIViewController] = []
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["ACHIEVEMENTS", "STATS", "SCOREBOARD"])
        control.selectedSegmentIndex = 0

        control.backgroundColor = .clear
        
        let normalFont = R.font.ibmPlexSansSemiBold(size: 13)
        let selectedFont = R.font.ibmPlexSansSemiBold(size: 13)

        control.setTitleTextAttributes([.foregroundColor: UIColor.gray, .font: normalFont as Any], for: .normal)

        control.setTitleTextAttributes([.foregroundColor: R.color.tabBarTint() as Any, .font: selectedFont as Any], for: .selected)

        if #available(iOS 13.0, *) {
            control.selectedSegmentTintColor = .clear
        } else {
            control.tintColor = .clear
        }

        control.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        control.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        control.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)

        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()

    
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
        
        view.addSubview(segmentedControl)
        setupSegmentedControlConstraints()
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        setupUserProfile()
        constraintsSetup()
        navigationBarSetup()
        setupPageViewController()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileImage.layer.cornerRadius = 30
    }
    
    private func setupUserProfile() {
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            profileImage.image = image
        }

        if let username = UserDefaults.standard.string(forKey: "username") {
            profileLabel.text = username
        }
    }
    
    private func setupSegmentedControlConstraints() {
        // Добавьте сюда ограничения для segmentedControl
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            segmentedControl.topAnchor.constraint(equalTo: profileLabel.bottomAnchor, constant: 32),
            segmentedControl.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    @objc private func segmentChanged(_ sender: UISegmentedControl) {
        // Обработка изменения выбранного сегмента
        if let selectedViewController = pageViewControllers[safe: sender.selectedSegmentIndex] {
            pageViewController.setViewControllers([selectedViewController], direction: .forward, animated: false, completion: nil)
        }
    }

    // MARK: - UIPageViewControllerDelegate methods

    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed, let visibleViewController = pageViewController.viewControllers?.first, let index = pageViewControllers.firstIndex(of: visibleViewController) {
            // Синхронизация segmentedControl с текущей страницей
            segmentedControl.selectedSegmentIndex = index
        }
    }
    
    func setupPageViewController() {
        // Создание UIPageViewController
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self

        // Создание контроллеров страниц
        let achievementsVC = AchievementsViewController()
        let statsVC = StatsViewController()
        let scoreboardVC = ScoreboardViewController()
        pageViewControllers = [achievementsVC, statsVC, scoreboardVC]

        // Установка начального контроллера
        if let firstViewController = pageViewControllers.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        // Добавление UIPageViewController в иерархию представлений
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)

        // Настройка ограничений для UIPageViewController
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 24),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: - UIPageViewControllerDataSource methods

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }

        guard pageViewControllers.count > previousIndex else {
            return nil
        }

        return pageViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        guard pageViewControllers.count != nextIndex else {
            return nil
        }

        guard pageViewControllers.count > nextIndex else {
            return nil
        }

        return pageViewControllers[nextIndex]
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
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),

            ])
        } else {
            NSLayoutConstraint.activate([
                profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),

            ])
        }
        
        NSLayoutConstraint.activate([
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

extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
