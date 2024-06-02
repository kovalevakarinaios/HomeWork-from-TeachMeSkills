//
//  ViewController.swift
//  HomeWork10_Karina
//
//  Created by Karina Kovaleva on 13.08.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        generateTabBar()
        setTabBarAppearance()
    }

    
//    func generateTabBar() {
//        viewControllers = [generateVC(viewcontroller: CircleGameViewController(), title: "Circle Game", image: UIImage(systemName: "circle")), generateVC(viewcontroller: StartForSquareGameVC(), title: "Square Game", image: UIImage(systemName: "square"))]
//    }
//
//    func generateVC (viewcontroller: UIViewController, title: String, image: UIImage?) -> UIViewController {
//        viewcontroller.tabBarItem.title = title
//        viewcontroller.tabBarItem.image = image
//        return viewcontroller
//    }
    
    func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        let roundLayer = CAShapeLayer()
        let bezierPath = UIBezierPath(roundedRect: CGRect(x: positionOnX, y: tabBar.bounds.minY - positionOnY, width: width, height: height), cornerRadius: height / 2)
        roundLayer.path = bezierPath.cgPath
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        tabBar.itemWidth = width / 3
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.lightGray.cgColor
        tabBar.layer.borderColor = UIColor.black.cgColor
        tabBar.tintColor = .red
        tabBar.unselectedItemTintColor = #colorLiteral(red: 0.976007998, green: 0.9250667095, blue: 0.9209936261, alpha: 1)
    }
}

