//
//  ViewController.swift
//  HomeWork4_Karina
//
//  Created by Karina Kovaleva on 17.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var labelEnglish: UILabel!
    @IBOutlet var buttonEnglish: UIButton!
    @IBOutlet var labelGerman: UILabel!
    @IBOutlet var buttonGerman: UIButton!
    @IBOutlet var labelRussian: UILabel!
    @IBOutlet var buttonRussian: UIButton!
    @IBOutlet var labelNorwegian: UILabel!
    @IBOutlet var buttonNorwegian: UIButton!
    @IBOutlet var labelJapanese: UILabel!
    @IBOutlet var buttonJapanese: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonEnglish.setTitle("click on me", for: .normal)
    }
    var counter = 0
    let primaryTextColor = UIColor.red
    
    @IBAction func buttonTap(_ sender: UIButton) {
        counter += Int.random(in: 1...3)
    }
    @IBAction func firstbuttonTap(_ sender: UIButton) {
        labelEnglish.text = String ("Количество нажатий - \(counter)!")
        labelEnglish.numberOfLines = 0
    }
    @IBAction func secondbuttonTap(_ sender: UIButton) {
        labelEnglish.text = String ("Количество нажатий - \(counter)!")
        labelGerman.text = String ("Количество нажатий - \(counter)!")
    }
    @IBAction func thirdbuttonTap(_ sender: UIButton) {
        labelGerman.text = String ("Количество нажатий - \(counter)!")
        labelRussian.text = String ("Количество нажатий - \(counter)!")
    }
    
    @IBAction func fourthbuttonTap(_ sender: UIButton) {
        var arrayOfButton: [UIButton] = [buttonEnglish!, buttonGerman!, buttonRussian!, buttonJapanese!, buttonNorwegian!]
        labelEnglish.textColor = primaryTextColor
        labelRussian.textColor = primaryTextColor
        labelGerman.textColor = primaryTextColor
        labelNorwegian.textColor = primaryTextColor
        labelJapanese.textColor = primaryTextColor
        arrayOfButton.forEach{$0.setTitleColor(.red, for: .normal)}
//        arrayOfButton.forEach{$0.setNeedsUpdateConfiguration()}
    }
    @IBAction func fifthbuttonTap(_ sender: UIButton) {
        labelEnglish.textColor = .black
        labelRussian.textColor = .black
        labelGerman.textColor = .black
        labelNorwegian.textColor = .black
        labelJapanese.textColor = .black
        buttonEnglish.setTitleColor(.black, for: .normal)
        buttonGerman.setTitleColor(.black, for: .normal)
        buttonRussian.setTitleColor(.black, for: .normal)
        buttonNorwegian.setTitleColor(.black, for: .normal)
        buttonJapanese.setTitleColor(.black, for: .normal)
     
    }
}
