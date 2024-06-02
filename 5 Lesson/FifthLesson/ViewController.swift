//
//  ViewController.swift
//  FifthLesson
//
//  Created by Karina Kovaleva on 18.07.22.
//

import UIKit

//var int: Int = 0
// файнал запрещает наследоваться
// внутри синглтона сеттингс с каунтером
final class SunSingletone {
    static let shared = SunSingletone()
    var setting: Settings = Settings()
    private init () {
    }
}

class Settings {
    var counter = 0
}
    //    static var setting = setting
    //    // запрещает создавать экземпляры SunSingletone

class ViewController: UIViewController {
    
    
// статик принадлежат классу вью контроллер
//    static let int = 0
// переменные класс наследуются, а статические нет
//    class var int: Int {
//        return 0
//    }

//    var int: Int {
//        return 0
//    }
    
//    lazy var int: Int = 0
//    lazy var int: Int = {
//        return 0
//    }()
//    var double: Double
//    var int: Int {
//        get {
//            return Int(double)
//        }
//        set {
//            double = Double(newValue)
//        }
//    }
    // обсерверы!
//    var int: Int {
//        willSet {
//
//        }
//        didSet {
//
//        }
//    }
    
    @IBOutlet var button: UIButton!
    
    @IBOutlet var button1: UIButton!
    
    @IBAction func add(_ sender: Any) {
        SunSingletone.shared.setting.counter += 1
    }
    
    @IBAction func print(_ sender: Any) {
        button1.setTitle(String(SunSingletone.shared.setting.counter), for: .normal) 
    }
    
        
        
//        ViewController.int
//        var patient1 = Patient(name: "petya", dateOfBirth: 2010, diagnosis: "headake", address: .init(address: "Minsk"))
//        print(int)
        
        // Do any additional setup after loading the view.
//        let bmwCar = BMW(logo: 123)
//        let bmwCar1 = BMW(logo: 123, engine: ElectricEngine())
//
//        bmwCar.bipbip()
//        bmwCar.ride()
//        bmwCar.engine.run()
//        bmwCar1.bipbip()
//        bmwCar1.ride()
//        bmwCar1.engine.run()
    }




// 2 класса - пациент, имя, диагноз, год рождения, адрес (это будет класс, адрес - одной строкой)

//class Patient {
//    var name: String
//    var dateOfBirth: Int
//    var diagnosis: String
//    var address: Address
//    init(name: String, dateOfBirth: Int, diagnosis: String, address: Address) {
//        self.name = name
//        self.dateOfBirth = dateOfBirth
//        self.diagnosis = diagnosis
//        self.address = address
//    }
//}

//class Address {
//    var address: String
//    init (address: String) {
//        self.address = address
//    }
//}

//class Engine {
//    var volume: Double
//    func run () {
//        print("Engine is running")
//    }
//    init(volume: Double) {
//        self.volume = volume
//    }
//}
//
//class GasolineEngine: Engine {
//    var coolingVolume: Double
//
//    override func run() {
//        print("GasolineEngine is running")
//    }
//    func badabum() {
//        print("Engine exploated")
//    }
//    init(coolingVolume: Double, volume: Double) {
//        self.coolingVolume = coolingVolume
//        super.init(volume: 0)
//    }
//
//}
//
//class ElectricEngine: Engine {
//    func charging() {
//        print("ElectricEngine is charging")
//    }
//    override func run() {
//        print("виу")
//    }
//    init() {
//        super .init(volume: 0)
//    }
//}
//
//class Car {
//    var engine: Engine
//    func ride () {
//    }
//    func bipbip () {
//        print ("Bip-bip")
//    }
//    init(engine: Engine) {
//        self.engine = engine
//    }
//}
//
//class BMW: Car {
//    var logo: Int
//    override func ride() {
//        print("BMW's running fast")
//    }
//    init (logo: Int, engine: Engine = GasolineEngine(coolingVolume: 5.0, volume: 3.0)) {
//        self.logo = logo
//        super .init(engine: engine)
//    }
//}
