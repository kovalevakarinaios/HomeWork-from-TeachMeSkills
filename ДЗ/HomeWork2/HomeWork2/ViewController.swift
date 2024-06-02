//
//  ViewController.swift
//  HomeWork2
//
//  Created by Karina Kovaleva on 7.07.22.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//  Выполнение задания 1
        print (sum(3, 4))
        print (multiplication(num1: 3.5, num2: 4.0))
        subtract(10, 20)
        divide(num1: 40, num2: 10)
        
//  Выполнение задания 2
        print(sumOfNumber(num: 12345667876))
        
//  Выполнение задания 3
        print (comparisonString("ab", "ba"))
        print (comparisonString_version2("абв", "ввш"))
        
//  Выполнение задания 3 (версия 2)
        
//  Выполнение задания 5
      power(number: 2, power: 10)
    }
    
//  Задание 1
    func sum (_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    func sum (_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    func subtract (_ a: Int, _ b: Int) -> Void {
        print ("Результат операции - \(a - b).")
    }
    func subtract (_ a: Double, _ b: Double) -> Double {
        return a - b
    }
    func multiplication (num1 a: Int, num2 b: Int) -> Int {
        return a * b
    }
    func multiplication (num1 a: Double, num2 b: Double) -> Double {
        return a * b
    }
    func divide (num1 a: Int, num2 b: Int) -> Void {
        print("Результат деления \(a) на \(b) - \(a / b)")
    }
    func divide (num1 a: Double, num2 b: Double) -> Double {
        return a / b
    }
    

//    Задание 2
    
    func sumOfNumber (num a: Int) -> Int {
        var sum = 0
        var newA = a
        while newA != 0 {
            sum += newA % 10
            newA = newA / 10
            }
        return sum
    }
    
//    Задание 3
    func comparisonString (_ a: String, _ b: String) -> Void {
        if a.count > b.count {
            return print("В первой строке больше символов")
        } else if a.count < b.count {
            return print("Во второй строке больше символов")
        } else {
            return print("В строках одинаковое количество символов")
        }
    }

    func comparisonString_version2 (_ a: String, _ b: String) -> Void {
        if a > b {
            return print("Первая строка больше.")
        } else if a < b {
            return print("Вторая строка больше.")
        } else {
            return print("Строки одинаковы")
        }
    }
    
    
//  Задание 4
    
    //func countDown (firstNum num: Int) -> Void {
    //    print(num)
    //    countDown(firstNum: num)
    //    }
    
//  Задание 5
    
    func power (number a: Double, power b: Double = 2) -> Void {
        let numberInPower = pow(a, b)
        print("Число \(a) в степени \(b) равно \(numberInPower) ")
    }
}


