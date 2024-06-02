//
//  TheSecondGame.swift
//  HomeWork6_Karina
//
//  Created by Karina Kovaleva on 23.07.22.
//

import UIKit

var x = 0
var y = 0

class TheSecondGame: UIViewController {
    let mainField = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 700))
    let buttonForSecondGame = UIButton(frame: CGRect(x: 107, y: 730, width: 200, height: 70))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let action = UIAction(handler: buttonTapped)
        
        view.backgroundColor = .white
        self.view.addSubview(mainField)
        mainField.backgroundColor = UIColor(red: 255 / 255, green: 228 / 255, blue: 196 / 255, alpha: 1)
        self.view.addSubview(buttonForSecondGame)
        buttonForSecondGame.backgroundColor = UIColor(red: 176 / 255, green: 224 / 255, blue: 230 / 255, alpha: 1)
        buttonForSecondGame.layer.cornerRadius = 35
        buttonForSecondGame.setTitle("Tap", for: .normal)
        buttonForSecondGame.titleLabel?.font = UIFont(name: fontForAnothersLabels, size: 25)
        buttonForSecondGame.layer.shadowColor = UIColor.gray.cgColor
        buttonForSecondGame.layer.shadowOffset = CGSize(width: 5, height: 5)
        buttonForSecondGame.layer.shadowOpacity = 0.7
        buttonForSecondGame.layer.shadowRadius = 2
        
        buttonForSecondGame.addAction(action, for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    func buttonTapped(_ action: UIAction) {
        while x < 351 {
        let newRectangle = UIView()
        mainField.addSubview(newRectangle)
        newRectangle.frame = CGRect(x: x, y: y, width: 70, height: 70)
        newRectangle.backgroundColor = getRandomColor()
        x += 70
            if x > 352 && y > 600 {
                newRectangle.backgroundColor = getRandomColor()
                x = 0
                y = 0
                break
            } else if x > 360 {
                newRectangle.backgroundColor = getRandomColor()
                x = 0
                y += 70
                }
            }
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
