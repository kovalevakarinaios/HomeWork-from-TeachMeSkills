//
//  ViewController.swift
//  FourthLesson
//
//  Created by Karina Kovaleva on 13.07.22.
//

import UIKit

//class Person {
//    var name: String = ""
//}
//
//class Waiter: Person {
//    func bringFood() {
//        print("Food will be on time")
//    }
//}
//
//struct PersonStruct {
//    var name: String = ""
//}

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var button: UIButton!
    @IBOutlet var label2: [UILabel]!
    
    var counter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.setTitle("Press me!", for: .normal)
        
        
        
        
//        let waiter = Waiter()
//        waiter.bringFood()
//        var personClass = Person()
//        personClass.name
//        var personStruct = PersonStruct()
//
//        var personClassSecond = personClass
//        var personStructSecond = personStruct
//
//        personClassSecond.name = "Vasya"
//        personStructSecond.name = "Kolya"
//
//
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: UIButton) {
        counter += 1
        label.text = String(counter)
        label2.forEach{$0.text = String(counter)}
    }
    
    
}

