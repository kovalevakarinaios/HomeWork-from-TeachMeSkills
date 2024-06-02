//
//  GrayViewController.swift
//  8 lesson
//
//  Created by Karina Kovaleva on 27.07.22.
//

import UIKit

class GrayViewController: UIViewController {
    var int = 0
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    init?(int: Int, coder: NSCoder) {
        self.int = int
        super.init(coder: coder)
    }
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
    @IBAction func unwindSegueGray (_ segue: UIStoryboardSegue) {
        print("print")
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        print("should")
        return true
    }
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "FromSecondToThird", sender: int)
    }
    
}
