//
//  PurpleViewController.swift
//  8 lesson
//
//  Created by Karina Kovaleva on 27.07.22.
//

import UIKit

class PurpleViewController: UIViewController {
let int = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func unwindSeguePurple (_ segue: UIStoryboardSegue) {
        print("print")
    }
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "FromThirdToFourth", sender: int)
    }
}
