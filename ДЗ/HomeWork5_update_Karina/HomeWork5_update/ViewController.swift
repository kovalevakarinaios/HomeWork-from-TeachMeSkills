//
//  ViewController.swift
//  HomeWork5_update
//
//  Created by Karina Kovaleva on 19.07.22.
//

import UIKit
import Foundation

final class BeerPub {
    static let shared = BeerPub()
    var lagerBeer = Beer(name: "Corona", price: 3.5, country: .Mexico, remainder: 49)
    var darkBeer = Beer(name: "Kaiserdom", price: 5.0, country: .Germany, remainder: 123)
    var mediumLightBeer = Beer(name: "Ferdinand", price: 8.2, country: .Czech_Republic, remainder: 31)
    private init () {
    }
}

class Beer {
    var name: String
    var price: Double
    var country: Country
    enum Country {
        case Germany, Czech_Republic, Mexico
    }
    var remainder: UInt
    init (name: String, price: Double, country: Country, remainder: UInt) {
        self.name = name
        self.price = price
        self.country = country
        self.remainder = remainder
    }
}

class ViewController: UIViewController {

    @IBOutlet var lagerBeerButton: UIButton!
    @IBOutlet var darkBeerButton: UIButton!
    @IBOutlet var mediumLightBeerButton: UIButton!
    @IBOutlet var lagerBeerLabel: UILabel!
    @IBOutlet var darkBeerLabel: UILabel!
    @IBOutlet var mediumLightBeerLabel: UILabel!
    @IBOutlet var sales: UILabel!
    @IBOutlet var endOfShift: UIButton!
   
    var counterLagerBeer: Double = 0
    @IBAction func saleOfLagerBeer(_ sender: Any) {
        if BeerPub.shared.lagerBeer.remainder == 0 {
            lagerBeerLabel.text = ("Пива нет")
            } else {
                BeerPub.shared.lagerBeer.remainder -= 1
                counterLagerBeer += 1
                lagerBeerLabel.text = (" Пиво - \(BeerPub.shared.lagerBeer.name)\n Цена - \(BeerPub.shared.lagerBeer.price)$\n Остаток - \(BeerPub.shared.lagerBeer.remainder) бут.\n Продажи - \(BeerPub.shared.lagerBeer.price * counterLagerBeer)$")
            }
        sales.text = "Продажи за смену: \(((round((BeerPub.shared.mediumLightBeer.price * counterMediumLightBeer) * 100) / 100))+(BeerPub.shared.darkBeer.price * counterDarkBeer)+(BeerPub.shared.lagerBeer.price * counterLagerBeer))$\n Продажи за смену(кол-во): \(counterDarkBeer+counterLagerBeer+counterMediumLightBeer) бут.\n Остаток: \(BeerPub.shared.darkBeer.remainder + BeerPub.shared.lagerBeer.remainder + BeerPub.shared.mediumLightBeer.remainder) бут."
        }
    var counterDarkBeer: Double = 0
    @IBAction func saleOfDarkBeer(_ sender: Any) {
        if BeerPub.shared.darkBeer.remainder == 0 {
            darkBeerLabel.text = ("Пива нет")
        } else {
            BeerPub.shared.darkBeer.remainder -= 1
            counterDarkBeer += 1
            darkBeerLabel.text = (" Пиво - \(BeerPub.shared.darkBeer.name)\n Цена - \(BeerPub.shared.darkBeer.price)$\n Остаток - \(BeerPub.shared.darkBeer.remainder) бут.\n Продажи - \(BeerPub.shared.darkBeer.price * counterDarkBeer)$")
        }
        sales.text = "Продажи за смену: \(((round((BeerPub.shared.mediumLightBeer.price * counterMediumLightBeer) * 100) / 100))+(BeerPub.shared.darkBeer.price * counterDarkBeer)+(BeerPub.shared.lagerBeer.price * counterLagerBeer))$\n Продажи за смену(кол-во): \(counterDarkBeer+counterLagerBeer+counterMediumLightBeer) бут.\n Остаток: \(BeerPub.shared.darkBeer.remainder + BeerPub.shared.lagerBeer.remainder + BeerPub.shared.mediumLightBeer.remainder) бут."
    }
    var counterMediumLightBeer: Double = 0
    @IBAction func saleOfMediumLightBeer(_ sender: Any) {
        if BeerPub.shared.mediumLightBeer.remainder == 0 {
            mediumLightBeerLabel.text = ("Пива нет")
        } else {
            BeerPub.shared.mediumLightBeer.remainder -= 1
            counterMediumLightBeer += 1
            mediumLightBeerLabel.text = (" Пиво - \(BeerPub.shared.mediumLightBeer.name)\n Цена - \(BeerPub.shared.mediumLightBeer.price)$\n Остаток - \(BeerPub.shared.mediumLightBeer.remainder) бут.\n Продажи - \((round((BeerPub.shared.mediumLightBeer.price * counterMediumLightBeer) * 100) / 100)) $")
        }
        sales.text = "Продажи за смену: \(((round((BeerPub.shared.mediumLightBeer.price * counterMediumLightBeer) * 100) / 100))+(BeerPub.shared.darkBeer.price * counterDarkBeer)+(BeerPub.shared.lagerBeer.price * counterLagerBeer))$\n Продажи за смену(кол-во): \(counterDarkBeer+counterLagerBeer+counterMediumLightBeer) бут.\n Остаток: \(BeerPub.shared.darkBeer.remainder + BeerPub.shared.lagerBeer.remainder + BeerPub.shared.mediumLightBeer.remainder) бут."
    }
    
    @IBAction func endOfShiftAction(_ sender: Any) {
        lagerBeerLabel.text = "Продаж нет"
        darkBeerLabel.text = "Продаж нет"
        mediumLightBeerLabel.text = "Продаж нет"
        sales.text = "Продажи за смену: 0.0$\n Продажи за смену(кол-во): 0 бут.\n Остаток: \(BeerPub.shared.darkBeer.remainder + BeerPub.shared.lagerBeer.remainder + BeerPub.shared.mediumLightBeer.remainder) бут."
            counterDarkBeer = 0
            counterLagerBeer = 0
            counterMediumLightBeer = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lagerBeerButton.setTitle(BeerPub.shared.lagerBeer.name + "\u{1F37A}", for: .normal)
        darkBeerButton.setTitle(BeerPub.shared.darkBeer.name + "\u{1F37A}", for: .normal)
        mediumLightBeerButton.setTitle(BeerPub.shared.mediumLightBeer.name + "\u{1F37A}", for: .normal)
        sales.text = "Продажи за смену: \((BeerPub.shared.mediumLightBeer.price * counterMediumLightBeer)+(BeerPub.shared.darkBeer.price * counterDarkBeer)+(BeerPub.shared.lagerBeer.price * counterLagerBeer))$\n Продажи за смену(кол-во): \(counterDarkBeer+counterLagerBeer+counterMediumLightBeer) бут.\n Остаток: \(BeerPub.shared.darkBeer.remainder + BeerPub.shared.lagerBeer.remainder + BeerPub.shared.mediumLightBeer.remainder) бут."
        // Do any additional setup after loading the view.
    }
}


