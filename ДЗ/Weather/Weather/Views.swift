//
//  Views.swift
//  Weather
//
//  Created by Karina Kovaleva on 2.12.22.
//

import UIKit

class HeaderView: UICollectionReusableView {
    var label = UILabel()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate(
            [
                label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ]
        )
    }
}


class Spacer: UICollectionReusableView {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
    }
}

class LetterCell: UICollectionViewCell {
    var letterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupViews() {
        contentView.addSubview(letterLabel)
        letterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 5
        
        NSLayoutConstraint.activate(
            [
                letterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                letterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ]
        )
    }
}
