//
//  ThirdViewController.swift
//  HomeWork9_Karina
//
//  Created by Karina Kovaleva on 12.08.22.
//

import UIKit

class ThirdViewController: UIViewController {
    @IBOutlet var to4VCButton: UIButton!
    let number = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        number.center = self.view.center
        self.view.addSubview(number)
        number.text = "3"
        number.textAlignment = .center
        to4VCButton.setTitle("Next", for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.forward.circle"), style: .done, target: self, action: #selector(rightButtonAction(sender:)))
    }
    override func viewWillAppear(_ animated: Bool) {
        self.showNavigationBar()
    }
    @IBAction func to4VCButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "From3To4", sender: nil )
    }
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        navigationController?.pushViewController(controller, animated: true)
    }
}
