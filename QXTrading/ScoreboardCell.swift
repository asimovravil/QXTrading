//
//  ScoreboardCell.swift
//  QXTrading
//
//  Created by Ravil on 05.12.2023.
//

import UIKit

final class ScoreboardCell: UITableViewCell {
    
    static let reuseID = String(describing: ScoreboardCell.self)
    
    public let cellPlace: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.place1()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let cellAva: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.accountImageCard()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let cellName: UILabel = {
        let label = UILabel()
        label.text = "Unknown Unnamed"
        label.textColor = .white
        label.alpha = 0.50
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansMedium(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let percentLabel: UILabel = {
        let label = UILabel()
        label.text = "0%"
        label.textColor = .white
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSansBold(size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellPlace)
        contentView.addSubview(cellAva)
        contentView.addSubview(cellName)
        contentView.addSubview(percentLabel)
        constraintsSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cellPlace.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellPlace.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            cellAva.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellAva.leadingAnchor.constraint(equalTo: cellPlace.trailingAnchor, constant: 16),
            cellAva.heightAnchor.constraint(equalToConstant: 40),
            cellAva.widthAnchor.constraint(equalToConstant: 40),
            
            cellName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellName.leadingAnchor.constraint(equalTo: cellAva.trailingAnchor, constant: 8),
            
            percentLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}

