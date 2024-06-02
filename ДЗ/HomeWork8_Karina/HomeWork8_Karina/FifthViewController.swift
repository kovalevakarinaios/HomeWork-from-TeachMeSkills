//
//  FifthViewController.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class FifthViewController: UIViewController {
    var text = ""
    @IBOutlet var textLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
    }
}
