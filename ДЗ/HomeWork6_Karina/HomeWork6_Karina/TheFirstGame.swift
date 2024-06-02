//
//  TheFirstGame.swift
//  HomeWork6_Karina
//
//  Created by Karina Kovaleva on 21.07.22.
//

import UIKit

class TheFirstGame: UIViewController {
    
    let circle = UIButton(frame: CGRect(x: Int.random(in: 10...342), y: Int.random(in: 10...768), width: 70, height: 70))
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let action = UIAction(handler: buttonTapped)
        
        self.view.addSubview(circle)
        view.backgroundColor = UIColor(red: 255 / 255, green: 235 / 255, blue: 205 / 255, alpha: 1)
        circle.backgroundColor = getRandomColor()
        circle.layer.cornerRadius = 35
        circle.layer.shadowRadius = 2
        circle.layer.shadowOffset = CGSize(width: 5, height: 5)
        circle.layer.shadowOpacity = 0.6
        circle.addAction(action, for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    func buttonTapped(_ action: UIAction) {
        circle.frame = CGRect(x: Int.random(in: 10...342), y: Int.random(in: 10...768), width: 70, height: 70)
        circle.backgroundColor = getRandomColor()
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
