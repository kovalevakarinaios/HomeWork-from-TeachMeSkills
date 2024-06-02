//
//  UserVC.swift
//  lesson diplinks
//
//  Created by Karina Kovaleva on 28.11.22.
//

import UIKit

class User {
    let name: String
    let surname: String
    let imageURL: URL
    let description: String
    init(name: String, surname: String, imageURL: URL, description: String) {
        self.name = name
        self.surname = surname
        self.imageURL = imageURL
        self.description = description
    }
}

class UserVC: ViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = .cyan
    }
}
