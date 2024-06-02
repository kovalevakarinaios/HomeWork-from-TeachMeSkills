//
//  HourlyTableViewCell.swift
//  Weather
//
//  Created by Karina Kovaleva on 2.12.22.
//

import UIKit

class HourlyTableViewCell: UICollectionViewCell {
    var letterLabel = UILabel()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    private func setupViews() {
        contentView.addSubview(letterLabel)
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            letterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            letterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

