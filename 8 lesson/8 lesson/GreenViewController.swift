//
//  GreenViewController.swift
//  8 lesson
//
//  Created by Karina Kovaleva on 27.07.22.
//

import UIKit

class GreenViewController: UIViewController {

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
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "FromFifthToSixth", sender: int)
    }
    
    @IBAction func onSecond(_ sender: Any) {
        performSegue(withIdentifier: "FromFifthToSecond", sender: int)
    }
}
