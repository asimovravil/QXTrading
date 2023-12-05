//
//  DayResultsCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

final class DayResultsCell: UITableViewCell {
    
    static let reuseID = String(describing: DayResultsCell.self)
    
    public let dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Day"
        label.textColor = .white
        label.alpha = 0.50
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let cellArrow: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.arrowCorrect()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(dayLabel)
        contentView.addSubview(cellArrow)
        contentView.addSubview(percentLabel)
        constraintsSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            dayLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            dayLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            cellArrow.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellArrow.trailingAnchor.constraint(equalTo: percentLabel.leadingAnchor, constant: -4),
        ])
    }
}

