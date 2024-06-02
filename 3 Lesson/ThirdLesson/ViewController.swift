//
//  ViewController.swift
//  ThirdLesson
//
//  Created by Karina Kovaleva on 11.07.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        var arrayOfInt = [1, 100, 2, 200, 3 , 300]
        let arrayOfInt1 = Array(repeating: 1, count: 10)
        var arrayOfString = ["A", "B", "C", "D"]
        var arrayOfString1 = Array(arrayLiteral: "5", "10", "123456")
        let arrayOfDouble = [1.234, 45.65353, 56.789]
        let arrayOfDouble1 = Array(repeating: 3.4, count: 4)
        var sumOfInt = arrayOfInt + arrayOfInt1
        let rangeArray = (1...5) + arrayOfInt
        
//        var sum = 0
//        for n in arrayOfInt {
//            sum += n
//        }
//        print(sum)
//
//        var sumForDouble: Double = 0
//        for n in arrayOfDouble {
//            sumForDouble += n.truncatingRemainder(dividingBy: 1)
//        }
//        print(sumForDouble)
//
//        var sumString = ""
//        for n in arrayOfString + arrayOfString1 {
//            sumString += n + " "
//        }
//        print(sumString)
        
        let resultArray = arrayOfDouble.map {%0}
        }
        resultArray
    }
//        print("Массив пустой - \(arrayOfString1.isEmpty)")
//        arrayOfString1.append("!")
//        print(arrayOfString1)
//        print("Третий элемент - \(arrayOfString1[3])")
//        var reverse = Array(arrayOfString1.reversed())
//        print(reverse)
//        reverse.remove(at: 0)
//        print(reverse)
//
//        var sum3: [Int] = []
//        for i in arrayOfDouble {
//            sum3.append(Int(i))
//        }
//
//
//        print(sum3)
    }
//        print(rangeArray)
////        arrayOfInt.removeAll()
//        let deleteElement = arrayOfInt.remove(at: 0)
//        arrayOfString.append("K")
//        arrayOfString.shuffle()
//        print(arrayOfString)
//        print(arrayOfString)
//        let tuple = Array(arrayOfString.enumerated())
//        print(tuple)
//
//        var sumString = ""
//
//        for letter in arrayOfString {
//            sumString += letter
//        }
//        print(sumString)
//
//        var doubles = arrayOfDouble.count
//        var one = rangeArray.count
//        while doubles > 0 {
//            doubles -= 1
//            print(doubles)
//        }
//        repeat {
//        one -= 1
//        print(one)
//        } while one > 0
//

    func sum() -> (Int, Double) {
        return (1, 1.0)
    }
    func named() -> (Int: Int, Double: Double) {
        return (1, 1.0)
    }
}
