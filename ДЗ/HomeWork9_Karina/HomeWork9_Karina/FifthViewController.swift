//
//  FifthViewController.swift
//  HomeWork9_Karina
//
//  Created by Karina Kovaleva on 12.08.22.
//

import UIKit

class FifthViewController: UIViewController {
    let number = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        number.center = self.view.center
        self.view.addSubview(number)
        number.text = "5"
        number.textAlignment = .center
    }
}
