//
//  BlueViewController.swift
//  8 lesson
//
//  Created by Karina Kovaleva on 27.07.22.
//

import UIKit

class BlueViewController: UIViewController {
let int = 10
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
    @IBSegueAction func instantiation(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> GrayViewController? {
        return GrayViewController(int: int, coder: coder)
    }
    @IBAction func unwindSegueBlue (_ segue: UIStoryboardSegue) {
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "FromFirstToSecond", sender: int)
    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as?
//            GrayViewController {
//            vc.int = self.int
//        } else {
//        }
//        segue.destination.view.backgroundColor = .red
//        print(segue.identifier)
//    }
}
