//
//  ViewController.swift
//  8 lesson
//
//  Created by Karina Kovaleva on 27.07.22.
//

import UIKit
let int = 1
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue) {
        print("print")
    }
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "FromFourthToFifth", sender: int)
    }
}

