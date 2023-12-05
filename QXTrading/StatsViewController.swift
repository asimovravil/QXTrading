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
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(DayResultsCell.self, forCellReuseIdentifier: DayResultsCell.reuseID)
        tableView.layer.cornerRadius = 26
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 42
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
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
        view.addSubview(tableView)
        view.backgroundColor = R.color.background()
        constraintsSetup()
        
        updateProgress(currentDay: 1)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        cardAccount.layer.cornerRadius = 20
    }
    
    func updateProgress(currentDay: Int, totalDays: Int = 30) {
        circularProgressBar.progressBarMode = .dayBased(totalDays: totalDays)
        circularProgressBar.setProgressWithAnimation(duration: 1, value: currentDay)
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cardAccount.topAnchor.constraint(equalTo: view.topAnchor),
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
            
            tableView.topAnchor.constraint(equalTo: labelTestResults.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension StatsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DayResultsCell.reuseID, for: indexPath) as? DayResultsCell else {
            fatalError("Could not cast to DayResultsCell")
        }
        cell.dayLabel.text = "Day \(indexPath.row + 1)"
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
