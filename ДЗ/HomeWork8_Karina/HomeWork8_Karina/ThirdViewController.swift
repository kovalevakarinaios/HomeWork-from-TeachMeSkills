//
//  ThirdViewController.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class ThirdViewController: UIViewController {
    var text = ""

    var pug = Dog(name: "Mike", age: 1, color: "black", breed: "pug")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func to4VCButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        controller.modalPresentationStyle = .fullScreen
        controller.text = self.text
        controller.pug = self.pug
        self.present(controller, animated: true, completion: nil)
    }
}
