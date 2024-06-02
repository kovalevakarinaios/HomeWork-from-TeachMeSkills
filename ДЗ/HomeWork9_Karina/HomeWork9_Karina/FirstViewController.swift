//
//  ViewController.swift
//  HomeWork9_Karina
//
//  Created by Karina Kovaleva on 12.08.22.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet var to2VC: UIButton!
    
    let number = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        number.center = self.view.center
        number.text = "1"
        number.textAlignment = .center
        self.view.addSubview(number)
        to2VC.setTitle("Next", for: .normal)
        navigationItem.title = "First"
    }
    @IBAction func to2VCButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "From1To2", sender: nil )
    }
}

extension UIViewController {
    func hideNavigationBar() {
        self.navigationController?.isNavigationBarHidden = true
    }
    func showNavigationBar() {
        self.navigationController?.isNavigationBarHidden = false
    }
}

