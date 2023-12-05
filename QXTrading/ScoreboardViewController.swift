//
//  ScoreboardViewController.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

class ScoreboardViewController: UIViewController {

    private var userProfileImage: UIImage?
    private var userName: String?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(ScoreboardCell.self, forCellReuseIdentifier: ScoreboardCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 72
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUserProfile()
        view.addSubview(tableView)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        tableView.reloadData()
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func setupUserProfile() {
        if let imageData = UserDefaults.standard.data(forKey: "userProfileImage"),
           let image = UIImage(data: imageData) {
            userProfileImage = image
        }

        if let username = UserDefaults.standard.string(forKey: "username") {
            userName = username
        }
    }
}

extension ScoreboardViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ScoreboardCell.reuseID, for: indexPath) as? ScoreboardCell else {
            fatalError("Could not cast to ScoreboardCell")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        
        switch indexPath.row {
        case 0:
            cell.cellPlace.image = R.image.place1()
            cell.cellAva.image = R.image.oliver()
            cell.cellName.text = "Oliver Bennett"
            cell.percentLabel.text = "100%"
            cell.percentLabel.textColor = R.color.tabBarTint()
        case 1:
            cell.cellPlace.image = R.image.place2()
            cell.cellAva.image = R.image.emily()
            cell.cellName.text = "Emily Rodriguez"
            cell.percentLabel.text = "99%"
            cell.percentLabel.textColor = R.color.tabBarTint()
        case 2:
            cell.cellPlace.image = R.image.place3()
            cell.cellAva.image = R.image.liam()
            cell.cellName.text = "Liam Foster"
            cell.percentLabel.text = "98%"
            cell.percentLabel.textColor = R.color.tabBarTint()
        case 3:
            cell.cellPlace.image = R.image.place4()
            cell.cellAva.image = R.image.aria()
            cell.cellName.text = "Aria Patel"
            cell.percentLabel.text = "90%"
            cell.percentLabel.textColor = .white.withAlphaComponent(0.50)
        case 4:
            cell.cellPlace.image = R.image.place6()
            cell.cellAva.image = R.image.jasper()
            cell.cellName.text = "Jasper Wallace"
            cell.percentLabel.text = "60%"
            cell.percentLabel.textColor = .white.withAlphaComponent(0.50)
        case 5:
            cell.cellPlace.image = R.image.place5()
            if let userName = userName, let userProfileImage = userProfileImage {
                cell.cellAva.image = userProfileImage
                cell.cellName.text = userName
            } else {
                cell.cellName.text = "Unknown Unnamed"
            }
            cell.percentLabel.text = "-"
            cell.backgroundColor = R.color.tabBarTint()
            cell.layer.cornerRadius = 20
        default:
            cell.cellPlace.image = R.image.place1()
            cell.cellName.text = "Unknown Unnamed"
            cell.percentLabel.text = "-"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
