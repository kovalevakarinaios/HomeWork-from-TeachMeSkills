//
//  ViewController.swift
//  HomeWork5_Karina
//
//  Created by Karina Kovaleva on 19.07.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lagerBeerButton: UIButton!
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
    
    var lagerBeer = Beer(name: "Corona", price: 3.5, country: .Mexico, remainder: 20)
    var darkBeer = Beer(name: "Kaiserdom", price: 5.0, country: .Germany, remainder: 35)
    var mediumLightBeer = Beer(name: "Ferdinand", price: 8.2, country: .Czech_Republic, remainder: 6)
    
    final class BeerPub {
        static let shared = BeerPub()
        private init () {
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lagerBeerButton.setTitle(lagerBeer.name, for: .normal)
    
        // Do any additional setup after loading the view.
    }


}

