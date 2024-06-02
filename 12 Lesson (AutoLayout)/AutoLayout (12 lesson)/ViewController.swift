//
//  ViewController.swift
//  AutoLayout (12 lesson)
//
//  Created by Karina Kovaleva on 10.08.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button: UIButton!
    @IBOutlet var constraintX: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.translatesAutoresizingMaskIntoConstraints = false
        // 1 способ
//        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        // 2 способ
//        let centerX = button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let centerX = button.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100)
//        let centerY = button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        NSLayoutConstraint.activate([centerX, centerY])
//    }
//        constraintX.constant = 100
    }
}

