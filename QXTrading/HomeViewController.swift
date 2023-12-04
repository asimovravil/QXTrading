//
//  HomeViewController.swift
//  QXTrading
//
//  Created by Ravil on 01.12.2023.
//

import UIKit

class HomeViewController: UIViewController {

    var cellTimes: [Int] = []
    
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
    
    private let labelStudy: UILabel = {
        let label = UILabel()
        label.text = "Study"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(DaysCell.self, forCellReuseIdentifier: DaysCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 80
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        view.addSubview(labelStudy)
        view.addSubview(tableView)
        cardAccount.addSubview(circularProgressBar)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        navigationBarSetup()
        updateProgress(currentDay: currentDay, totalDays: 30)
        
        if let username = UserDefaults.standard.string(forKey: "username") {
            labelAccount.text = username
        }

        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            imageAccount.image = image
        }
        
        if let savedTimes = UserDefaults.standard.array(forKey: "cellTimes") as? [Int], savedTimes.count == 30 {
            cellTimes = savedTimes
        } else {
            for _ in 1...30 {
                cellTimes.append(Int.random(in: 10...30))
            }
            UserDefaults.standard.set(cellTimes, forKey: "cellTimes")
        }
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
        if UIScreen.main.bounds.size.height >= 812 {
            NSLayoutConstraint.activate([
                cardAccount.topAnchor.constraint(equalTo: view.topAnchor, constant: 131),
            ])
        } else {
            NSLayoutConstraint.activate([
                cardAccount.topAnchor.constraint(equalTo: view.topAnchor, constant: 91),
            ])
        }
        
        NSLayoutConstraint.activate([
            cardAccount.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            cardAccount.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            cardAccount.heightAnchor.constraint(equalToConstant: 178),
            
            imageAccount.topAnchor.constraint(equalTo: cardAccount.topAnchor, constant: 12),
            imageAccount.leadingAnchor.constraint(equalTo: cardAccount.leadingAnchor, constant: 16),
            imageAccount.heightAnchor.constraint(equalToConstant: 60),
            imageAccount.widthAnchor.constraint(equalToConstant: 60),
            
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
            
            labelStudy.topAnchor.constraint(equalTo: cardAccount.bottomAnchor, constant: 24),
            labelStudy.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            tableView.topAnchor.constraint(equalTo: labelStudy.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DaysCell.reuseID, for: indexPath) as? DaysCell else {
            fatalError("Could not cast to DaysCell")
        }
        
        let dayNumber = indexPath.row + 1
        if dayNumber >= 4 {
            cell.cellDayImage.image = UIImage(named: "dayClose\(dayNumber)")
            cell.isUserInteractionEnabled = false
        } else {
            cell.cellDayImage.image = UIImage(named: "day\(dayNumber)")
            cell.isUserInteractionEnabled = true
        }
        
        let time = cellTimes[indexPath.row]
        cell.cellLabelTime.text = "\(time) min"
        
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dayCategoryVC = DayCategoryViewController()
        dayCategoryVC.selectedDay = indexPath.row + 1
        navigationController?.pushViewController(dayCategoryVC, animated: true)
    }
}
