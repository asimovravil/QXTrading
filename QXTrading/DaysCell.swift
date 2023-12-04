//
//  DaysCell.swift
//  QXTrading
//
//  Created by Ravil on 04.12.2023.
//

import UIKit

final class DaysCell: UITableViewCell {
    
    static let reuseID = String(describing: DaysCell.self)
    
    private let cellCard: UIView = {
        let uiView = UIView()
        uiView.backgroundColor = R.color.colorTextField()
        uiView.layer.cornerRadius = 20
        uiView.translatesAutoresizingMaskIntoConstraints = false
        return uiView
    }()
    
    public let cellDayImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.day1()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let cellClock: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.clock()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    public let cellLabelTime: UILabel = {
        let label = UILabel()
        label.text = "12 min"
        label.textColor = .white
        label.alpha = 0.50
        label.numberOfLines = 0
        label.font = R.font.ibmPlexSans(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let cellArrowClose: UIImageView = {
        let imageView = UIImageView()
        imageView.image = R.image.arrowClose()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellCard)
        contentView.addSubview(cellDayImage)
        contentView.addSubview(cellClock)
        contentView.addSubview(cellLabelTime)
        contentView.addSubview(cellArrowClose)
        constraintsSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraintsSetup() {
        NSLayoutConstraint.activate([
            cellCard.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellCard.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            cellCard.heightAnchor.constraint(equalToConstant: 64),
            
            cellDayImage.leadingAnchor.constraint(equalTo: cellCard.leadingAnchor, constant: 12),
            cellDayImage.centerYAnchor.constraint(equalTo: cellCard.centerYAnchor),
            
            cellClock.leadingAnchor.constraint(equalTo: cellDayImage.trailingAnchor, constant: 60),
            cellClock.centerYAnchor.constraint(equalTo: cellDayImage.centerYAnchor),
            
            cellLabelTime.leadingAnchor.constraint(equalTo: cellClock.trailingAnchor, constant: 4),
            cellLabelTime.centerYAnchor.constraint(equalTo: cellClock.centerYAnchor),
            
            cellArrowClose.trailingAnchor.constraint(equalTo: cellCard.trailingAnchor, constant: -12),
            cellArrowClose.centerYAnchor.constraint(equalTo: cellCard.centerYAnchor),
        ])
    }
}

