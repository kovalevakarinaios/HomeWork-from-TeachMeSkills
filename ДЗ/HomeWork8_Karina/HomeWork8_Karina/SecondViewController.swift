//
//  SecondViewController.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class SecondViewController: UIViewController {
    var text = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func to3VCButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "From2To3", sender: text)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           guard segue.identifier == "From2To3" else { return }
           guard let destination = segue.destination as? ThirdViewController else { return }
        destination.text = text
       }

}
