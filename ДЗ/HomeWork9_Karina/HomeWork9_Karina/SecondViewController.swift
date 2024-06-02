//
//  SecondViewController.swift
//  HomeWork9_Karina
//
//  Created by Karina Kovaleva on 12.08.22.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var to3VCButton: UIButton!
    @IBOutlet var backTo1Button: UIButton!
    let number = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        number.center = self.view.center
        number.text = "2"
        number.textAlignment = .center
        to3VCButton.setTitle("Next", for: .normal)
        backTo1Button.setTitle("Back", for: .normal)
        self.view.addSubview(number)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.hideNavigationBar()
    }
    @IBAction func to3VCButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "From2To3", sender: nil )
    }
    
    @IBAction func backTo1ButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
