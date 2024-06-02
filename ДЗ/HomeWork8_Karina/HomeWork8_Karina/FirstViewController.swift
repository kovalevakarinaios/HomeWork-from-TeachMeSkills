//
//  ViewController.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class FirstViewController: UIViewController {
    let text = "Hello, world!"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func to2VCButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        controller.modalPresentationStyle = .fullScreen
        controller.text = self.text
        self.present(controller, animated: true, completion: nil)
    }
    
}

