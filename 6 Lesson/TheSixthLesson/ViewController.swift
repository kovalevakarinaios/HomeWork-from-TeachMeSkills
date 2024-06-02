//
//  ViewController.swift
//  TheSixthLesson
//
//  Created by Karina Kovaleva on 20.07.22.
//

import UIKit
let redView = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
//    let blueButton = UIButton(frame: CGRect(x: 150, y: 300, width: 80, height: 30))
let yellowView = UIView(frame: CGRect(x: 50, y: 500, width: 70, height: 70))
let greenView = UIView(frame: CGRect(x: 300, y: 200, width: 50, height: 50))
let magentaView = UIView(frame: CGRect(x: 250, y: 650, width: 30, height: 30))
class ViewController: UIViewController {
var frameOfRed = redView.frame.origin
var frameOfYellow = yellowView.frame.origin
var frameOfGreen = greenView.frame.origin
var frameOfMagenta = magentaView.frame.origin
    
    @IBOutlet var button: UIButton!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redView.backgroundColor = .red
        self.view.addSubview(redView)
        
//        blueButton.backgroundColor = .blue
//        self.view.addSubview(blueButton)
        yellowView.backgroundColor = .yellow
        self.view.addSubview(yellowView)
        
        greenView.backgroundColor = .green
        self.view.addSubview(greenView)
        
        magentaView.backgroundColor = .magenta
        self.view.addSubview(magentaView)
        
//        let firstView = UIView(frame: CGRect(origin: CGPoint(x: 40, y: 30), size: CGSize(width: 60, height: 40)))
//        firstView.backgroundColor = .cyan
//        self.view.addSubview(firstView)
//        let secondView = UIView(frame: CGRect(x: 20, y: 10, width: 10, height: 10))
//        secondView.backgroundColor = .magenta
//        firstView.addSubview(secondView)
       
//        redView.center = self.view.center
//        redView.layer.cornerRadius = 20
        // masksToBounds  - обрезает
//        redView.layer.masksToBounds = true
//        redView.layer.borderColor = UIColor.black.cgColor
//        redView.layer.borderWidth = 5 / UIScreen.main.scale
        
        //        blueButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
//        blueButton.addAction(UIAction(handler: { action in
//        }), for: .touchUpInside)
//        redView.frame.origin = .init(x: 200, y: 200)
        
       
//        let blackView = UIView(frame: CGRect(x: 10, y: 10, width: 10, height: 10))
//        blackView.backgroundColor = .black
//        magentaView.addSubview(blackView)
//        let sixthView = UIView(frame: CGRect(origin: .zero, size: CGSize (width: 200, height: 200)))
//        sixthView.backgroundColor = .orange
//        yellowView.addSubview(sixthView)
// yellowView.bringSubviewToFront(<#T##view: UIView##UIView#>) - на передний план
        
        
        
        
        }
 
    @IBAction func changeState(_ sender: Any) {
        redView.frame.origin = frameOfYellow
        yellowView.frame.origin = frameOfMagenta
        magentaView.frame.origin = frameOfGreen
        greenView.frame.origin = frameOfRed
    }
    
    
}
