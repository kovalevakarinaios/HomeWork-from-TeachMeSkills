//
//  ViewController.swift
//  HomeWork6_Karina
//
//  Created by Karina Kovaleva on 21.07.22.
//

import UIKit

let fontForMainLabel = "Verdana"
let fontForAnothersLabels = "Marker Felt"

class ViewController: UIViewController {
    @IBOutlet var theFirstGameButton: UIButton!
    @IBOutlet var theSecondGameButton: UIButton!
    @IBOutlet var theThirdGameButton: UIButton!
    
    let labelForFirstGame = UILabel(frame: CGRect(x: 107, y: 230, width: 200, height: 70))
    let labelForSecondGame = UILabel(frame: CGRect(x: 96, y: 430, width: 220, height: 70))
    let labelForThirdGame = UILabel(frame: CGRect(x: 107, y: 630, width: 200, height: 70))
    let mainLabel = UILabel(frame: CGRect(x: 35, y: 100, width: 350, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let color1ForGradient = UIColor(red: 255 / 255, green: 228 / 255, blue: 196 / 224, alpha: 1.0).cgColor
        let color2ForGradient = UIColor(red: 244 / 255, green: 164 / 255, blue: 96 / 255, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [color1ForGradient, color2ForGradient]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        self.view.addSubview(mainLabel)
        mainLabel.text = ("Choose the game")
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.textAlignment = .center
        mainLabel.font = UIFont(name: fontForMainLabel, size: 39)
        
        theFirstGameButton.backgroundColor = UIColor(red: 255 / 255, green: 235 / 255, blue: 205 / 255, alpha: 1)
        theFirstGameButton.frame = CGRect(x: 107, y: 300, width: 200, height: 70)
        theFirstGameButton.layer.cornerRadius = 35
        theFirstGameButton.layer.shadowColor = UIColor.gray.cgColor
        theFirstGameButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        theFirstGameButton.layer.shadowOpacity = 0.7
        theFirstGameButton.layer.shadowRadius = 2
        theFirstGameButton.setTitle("Press me", for: .normal)
        theFirstGameButton.titleLabel?.font = UIFont(name: fontForAnothersLabels, size: 25)
        
        self.view.addSubview(labelForFirstGame)
        labelForFirstGame.text = ("The First Game")
        labelForFirstGame.lineBreakMode = .byWordWrapping
        labelForFirstGame.textAlignment = .center
        labelForFirstGame.font = UIFont(name: fontForAnothersLabels, size: 30)
        
        self.view.addSubview(theSecondGameButton)
        theSecondGameButton.frame = CGRect(x: 107, y: 500, width: 200, height: 70)
        theSecondGameButton.backgroundColor = UIColor(red: 255 / 255, green: 228 / 255, blue: 196 / 255, alpha: 1)
        theSecondGameButton.layer.cornerRadius = 35
        theSecondGameButton.layer.shadowColor = UIColor.gray.cgColor
        theSecondGameButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        theSecondGameButton.layer.shadowOpacity = 0.7
        theSecondGameButton.layer.shadowRadius = 2
        theSecondGameButton.setTitle("Press me", for: .normal)
        theSecondGameButton.titleLabel?.font = UIFont(name: fontForAnothersLabels, size: 25)
        
        self.view.addSubview(labelForSecondGame)
        labelForSecondGame.text = ("The Second Game")
        labelForSecondGame.lineBreakMode = .byWordWrapping
        labelForSecondGame.textAlignment = .center
        labelForSecondGame.font = UIFont(name: fontForAnothersLabels, size: 30)
        
        self.view.addSubview(theThirdGameButton)
        theThirdGameButton.frame = CGRect(x: 107, y: 700, width: 200, height: 70)
        theThirdGameButton.backgroundColor = UIColor(red: 255 / 255, green: 222 / 255, blue: 173 / 255, alpha: 1)
        theThirdGameButton.layer.cornerRadius = 35
        theThirdGameButton.layer.shadowColor = UIColor.gray.cgColor
        theThirdGameButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        theThirdGameButton.layer.shadowOpacity = 0.7
        theThirdGameButton.layer.shadowRadius = 2
        theThirdGameButton.setTitle("Press me", for: .normal)
        theThirdGameButton.titleLabel?.font = UIFont(name: fontForAnothersLabels, size: 25)
        
        self.view.addSubview(labelForThirdGame)
        labelForThirdGame.text = ("The Third Game")
        labelForThirdGame.lineBreakMode = .byWordWrapping
        labelForThirdGame.textAlignment = .center
        labelForThirdGame.font = UIFont(name: fontForAnothersLabels, size: 30)
        
        // Do any additional setup after loading the view.
    }


}

func getRandomColor() -> UIColor {
// drand48() возвращает случайное число в диапазоне от 0.0 до 1.0
     let red: CGFloat = CGFloat (drand48())
     let green: CGFloat = CGFloat (drand48())
     let blue: CGFloat = CGFloat (drand48())
     return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
}
