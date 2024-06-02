//
//  CollectionViewCell.swift
//  25 Lesson
//
//  Created by Karina Kovaleva on 31.10.22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let id = "CollectionViewCell"
    
    var button: UIButton = {
        var button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Hello", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            button.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            button.rightAnchor.constraint(equalTo: self.contentView.rightAnchor),
            button.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
