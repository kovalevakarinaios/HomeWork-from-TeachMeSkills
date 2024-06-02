//
//  FourthViewController.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet var labelForClass: UILabel!
    var text = ""
    var pug: Dog!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelForClass.text = (" Name: \(pug.name)\n Breed: \(pug.breed)\n Age: \(pug.age) year\n Color: \(pug.color)")
        labelForClass.numberOfLines = 0
    }
    
    @IBAction func to5VCButtonPressed(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "FifthViewController") as! FifthViewController
        controller.modalPresentationStyle = .fullScreen
        controller.text = self.text
        self.present(controller, animated: true, completion: nil)
    }
}
