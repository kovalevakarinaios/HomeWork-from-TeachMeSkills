//
//  ViewController.swift
//  SecondLesson
//
//  Created by Karina Kovaleva on 4.07.22.
//

import UIKit

class ViewController: UIViewController {
    
    var integer = 10
    
    
    
    func sum () {
    integer = integer + 5 - 10 * 2 * 1_000_000
}
    func string () {
    integer = integer.distance(to: 1_000_000)
}
    func new () {
    integer = integer * 2
}
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var localVar = 1
        print(localVar)
        print(math(a: 3.4, b: 4.5))
        print(math(a: 2, b: 3))
    }
    func math (a: Int, b: Int) -> Int {
        return a * b
    }
    func math (a: Double, b: Double) -> Double {
        return a - b
    }
    func sumOfAnyNumbers(a: Any...) -> Double {
        <#function body#>
    }
}
