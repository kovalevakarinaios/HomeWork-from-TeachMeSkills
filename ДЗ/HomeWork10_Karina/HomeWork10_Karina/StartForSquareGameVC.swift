//
//  StartForSquareGameViewController.swift
//  HomeWork10_Karina
//
//  Created by Karina Kovaleva on 14.08.22.
//

import UIKit

class StartForSquareGameVC: UIViewController {

    @IBOutlet var buttonForStart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.7306796908, green: 0.9327645898, blue: 0.9348157644, alpha: 1)
        buttonForStart.titleLabel?.font = UIFont(name: "Marker Felt", size: 50)
        buttonForStart.center = self.view.center
        buttonForStart.setTitle("START GAME", for: .normal)
        let action = UIAction(handler: toGameButtonPressed(_:))
        buttonForStart.addAction(action, for: .touchUpInside)
    }
    
    func toGameButtonPressed(_ action: UIAction){
        let controller = storyboard?.instantiateViewController(withIdentifier: "SquareGameViewController") as! SquareGameViewController
        navigationController?.pushViewController(controller, animated: true)
    }
}
