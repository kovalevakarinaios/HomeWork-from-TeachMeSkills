//
//  SquareGameViewController.swift
//  HomeWork10_Karina
//
//  Created by Karina Kovaleva on 13.08.22.
//

import UIKit

enum Direction {
    case up
    case down
    case  right
    case left
}

class SquareGameViewController: UIViewController {
    let sizeOfSquare = CGSize(width: 100, height: 100)
    let step = CGFloat(50)
    let squareMotion = UIView()
    let squareStatic = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        squareMotion.backgroundColor = squareMotion.getRandomColor()
        squareStatic.backgroundColor = squareStatic.getRandomColor()
        squareStatic.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: sizeOfSquare)
        squareStatic.center = self.view.center
        squareMotion.frame = CGRect(origin: CGPoint(x: 80, y: 60), size: sizeOfSquare)
        self.view.addSubview(squareMotion)
        self.view.addSubview(squareStatic)
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(upSwipeDetected))
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(downSwipeDetected))
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(rightSwipeDetected))
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeDetected))
        upSwipeRecognizer.direction = .up
        downSwipeRecognizer.direction = .down
        rightSwipeRecognizer.direction = .right
        leftSwipeRecognizer.direction = .left

        self.view.addGestureRecognizer(upSwipeRecognizer)
        self.view.addGestureRecognizer(rightSwipeRecognizer)
        self.view.addGestureRecognizer(leftSwipeRecognizer)
        self.view.addGestureRecognizer(downSwipeRecognizer)
       
    }
    
    @IBAction func upSwipeDetected() {
        step(direction: .up)
        intersectsFrame()
    }
    
    @IBAction func downSwipeDetected() {
        step(direction: .down)
        intersectsFrame()
    }
    
    @IBAction func rightSwipeDetected() {
        step(direction: .right)
        intersectsFrame()
    }
    
    @IBAction func leftSwipeDetected() {
        step(direction: .left)
        intersectsFrame()
    }
    
    func step (direction: Direction) {
        switch direction {
        case .up:
            squareMotion.frame.origin.y -= step
        case .down:
            squareMotion.frame.origin.y += step
        case .right:
            squareMotion.frame.origin.x += step
        case .left:
            squareMotion.frame.origin.x -= step
        }
    }
    
    func intersectsFrame () -> Void {
        if squareMotion.frame.intersects(squareStatic.frame) {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
}
