//
//  ViewController.swift
//  7 lesson
//
//  Created by Karina Kovaleva on 25.07.22.
//

import UIKit

//enum Control {
//    case up (UILabel)
//    case down (Int)
//    case right
//    case left (UILabel, Int)
//}

//enum Day: String {
//    case sunrise = "sunrise"
//    case moon = "moon"
//    case sunset = "sunset"
//}

enum Math {
    indirect case Multiply(Math)
}


class ViewController: UIViewController {
    @IBOutlet var фсешщт: UIButton!
    //    var control: Control = .up(UILabel())
    @IBAction func асешщт(_ sender: Any) {
        performSegue(withIdentifier: "123", sender: Any?)
    }
    //    var day = Day.moon.rawValue
    override func viewDidLoad() {
        super.viewDidLoad()
//        control = .down(210)
        // Do any additional setup after loading the view.
//        switch day {
//        case Day.sunrise.rawValue:
//            let image = UIImage(systemName: Day.sunrise.rawValue)
//            let imageView = UIImageView(image: image)
//            imageView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
//            self.view.addSubview(imageView)
//            imageView.center = self.view.center
//        case Day.moon.rawValue:
//            let image = UIImage(systemName: Day.moon.rawValue)
//            let imageView = UIImageView(image: image)
//            imageView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
//            self.view.addSubview(imageView)
//            imageView.center = self.view.center
//        case Day.sunset.rawValue:
//            let image = UIImage(systemName: Day.sunset.rawValue)
//            let imageView = UIImageView(image: image)
//            imageView.frame = CGRect(x: 100, y: 300, width: 200, height: 200)
//            self.view.addSubview(imageView)
//            imageView.center = self.view.center
//        default:
//            print("ничего")
//        }
        
        
//        control = .left(UILabel(), 20000)
//        switch control {
//        case let .up(button):
//            print("up - \(button)")
//        case let .down (int):
//            print("down - \(int)")
//        case .right:
//            print("right")
//        case let .left(tuple):
//            print("left - \(tuple.0) \(tuple.1)")
//        case .left(let  label, _):
//            print("left - \(label)")
//        }
//
//        if case .up(let button) = control {
//            print(button)
//        } else {
//
//        }
        
//        print(Control.allCases)
    }
}

