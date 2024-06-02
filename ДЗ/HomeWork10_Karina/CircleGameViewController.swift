//
//  CircleGameViewController.swift
//  HomeWork10_Karina
//
//  Created by Karina Kovaleva on 13.08.22.
//

import UIKit

class CircleGameViewController: UIViewController {
    let circleSize = CGSize(width: 50, height: 50)
    var arrayOfCircles = [UIView()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapDetected))
        self.view.addGestureRecognizer(recognizer)
    }
    
    override func viewWillAppear(_ animated: Bool)  {
        let buttonForRemoveAllCircles = UIButton(frame: CGRect(x: 95, y: 50, width: 200, height: 30))
        buttonForRemoveAllCircles.setTitle("Remove All", for: .normal)
        buttonForRemoveAllCircles.backgroundColor = .red
        buttonForRemoveAllCircles.titleLabel?.font = UIFont(name: "Marker Felt", size: 20)
        buttonForRemoveAllCircles.layer.cornerRadius = buttonForRemoveAllCircles.frame.height / 2
        buttonForRemoveAllCircles.layer.shadowColor = UIColor.gray.cgColor
        buttonForRemoveAllCircles.layer.shadowOffset = CGSize(width: 5, height: 5)
        buttonForRemoveAllCircles.layer.shadowOpacity = 0.7
        buttonForRemoveAllCircles.layer.shadowRadius = 2
        self.view.addSubview(buttonForRemoveAllCircles)
        buttonForRemoveAllCircles.addAction((UIAction(handler: removeAllCircles)), for: .touchUpInside)
    }
    
    @IBAction func tapDetected(recognizer: UITapGestureRecognizer) {
        let locationTapInView = recognizer.location(in: self.view)
        let circle = UIView()
        circle.frame.size = circleSize
        circle.layer.cornerRadius = CGFloat(circleSize.width / 2)
        circle.backgroundColor = circle.getRandomColor()
        circle.center = CGPoint(x: locationTapInView.x, y: locationTapInView.y)
        removeIntersectsCircle(circle: circle)
        self.view.addSubview(circle)
        arrayOfCircles.append(circle)
    }
    
    func removeIntersectsCircle (circle: UIView) {
        for anyCircle in arrayOfCircles {
            if circle.frame.intersects(anyCircle.frame) {
                anyCircle.removeFromSuperview()
                arrayOfCircles = arrayOfCircles.filter { $0 != anyCircle }
            }
        }
    }
    
    func removeAllCircles (_ action: UIAction) -> Void {
        view.subviews.forEach { $0.removeFromSuperview() }
        arrayOfCircles = []
        tabBarController?.selectedViewController = tabBarController?.viewControllers![1]
    }
}


