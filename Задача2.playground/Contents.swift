class Vehicle {
    
    enum Fuel {
        case gas
        case petrol
        case diesel
    }
    
    let licensePlate: String
    let year: UInt
    let brand: String
    let model: String
    let fuel: Fuel
    let fuelConsumption: Double
    private var remainingFuel: Double
    private var numberOfRepairs: UInt
    
    init(licensePlate: String, year: UInt, brand: String, model: String, fuel: Fuel, fuelConsumption: Double, remainingFuel: Double, numberOfRepairs: UInt) {
        self.licensePlate = licensePlate
        self.year = year
        self.brand = brand
        self.model = model
        self.fuel = fuel
        self.fuelConsumption = fuelConsumption
        self.remainingFuel = remainingFuel
        self.numberOfRepairs = numberOfRepairs
    }

    final func refuel(amount: Double) -> Void {
        remainingFuel += amount
        print("Remaining fuel - \(remainingFuel) ")
    }
    
    final func repair() -> Void {
        numberOfRepairs += 1
        print("The car has been repaired \(numberOfRepairs) times")
    }
}

class FreightTransport: Vehicle {
 
    enum BodyType: String {
        case tent, trunk = "Manufactured goods"
        case refrigerator = "Short-lived commodities"
        case cistern = "Liquids"
    }
    
    let loadCapacity: Double
    let bodyCapacity: Double
    let type: BodyType
    let typeOfCargo: String
    
    init(licensePlate: String, year: UInt, brand: String, model: String, fuel: Fuel, fuelConsumption: Double, remainingFuel: Double, numberOfRepairs: UInt, loadCapacity: Double, bodyCapacity: Double, type: BodyType) {
        self.loadCapacity = loadCapacity
        self.bodyCapacity = bodyCapacity
        self.type = type
        self.typeOfCargo = type.rawValue
        super.init(licensePlate: licensePlate, year: year, brand: brand, model: model, fuel: fuel, fuelConsumption: fuelConsumption, remainingFuel: remainingFuel, numberOfRepairs: numberOfRepairs)
    }
    
    final func seal() {
        print("The vehicle is sealed, suitable for the carriage of goods")
    }
}

class PassengerTransport: Vehicle {
    let passengerCapacity: UInt
    
    init(licensePlate: String, year: UInt, brand: String, model: String, fuel: Fuel, fuelConsumption: Double, remainingFuel: Double, numberOfRepairs: UInt, passengerCapacity: UInt) {
        self.passengerCapacity = passengerCapacity
        super.init(licensePlate: licensePlate, year: year, brand: brand, model: model, fuel: fuel, fuelConsumption: fuelConsumption, remainingFuel: remainingFuel, numberOfRepairs: numberOfRepairs)
    }
    
    final func disinfect() {
        print("The vehicle is disinfected")
    }
}

class Order {
    let startPoint: String
    let destination: String
    let distance: Double
   
    init(startPoint: String, destination: String, distance: Double) {
        self.startPoint = startPoint
        self.destination = destination
        self.distance = distance
    }
}

class DeliveryOfGoods: Order {

    enum TypeOfCargo {
        case manufacturedGoods
        case shortLivedCommodities
        case liquids
    }

    let cargoVolume: Double
    let cargoWeight: Double
    let typeOfCargo: TypeOfCargo
    
    init(startPoint: String, destination: String, distance: Double, cargoVolume: Double, cargoWeight: Double, typeOfCargo: TypeOfCargo) {
        self.cargoWeight = cargoWeight
        self.cargoVolume = cargoVolume
        self.typeOfCargo = typeOfCargo
        super.init(startPoint: startPoint, destination: destination, distance: distance)
    }
}

class TransportationOfPassengers: Order {
    let passengers: UInt
    init(startPoint: String, destination: String, distance: Double, passengers: UInt) {
        self.passengers = passengers
        super.init(startPoint: startPoint, destination: destination, distance: distance)
    }
}

func autopark() -> Void {
    
    let refrigeratorTransport = FreightTransport(licensePlate: "3456AO-6", year: 2010, brand: "MAN", model: "TGA 18.310", fuel: .petrol, fuelConsumption: 26.5, remainingFuel: 120, numberOfRepairs: 5, loadCapacity: 10_200, bodyCapacity: 40, type: .refrigerator)
    let tentTransport = FreightTransport(licensePlate: "4678OP-7", year: 2020, brand: "Isuzu", model: "NQR75R", fuel: .gas, fuelConsumption: 20, remainingFuel: 30, numberOfRepairs: 0, loadCapacity: 5_000, bodyCapacity: 30, type: .tent)
    let cisternTransport = FreightTransport(licensePlate: "9341ИР-5", year: 2015, brand: "КАМАЗ", model: "43118-23027-50", fuel: .diesel, fuelConsumption: 14.5, remainingFuel: 10, numberOfRepairs: 3, loadCapacity: 1_000, bodyCapacity: 12, type: .cistern)
    let passengerTransport = PassengerTransport(licensePlate: "7301ОЛ-7", year: 2015, brand: "Volkswagen", model: "Transporter", fuel: .petrol, fuelConsumption: 8.9, remainingFuel: 20, numberOfRepairs: 10, passengerCapacity: 12)
    
    let vehicles = [refrigeratorTransport, tentTransport, cisternTransport, passengerTransport]
    
    let passengerOrder = TransportationOfPassengers(startPoint: "Минск, пр-т Независимости, 95", destination: "Минск, ул. Первомайская, 6", distance: 10.7, passengers: 10)
    let deliveryOrder = DeliveryOfGoods(startPoint: "Минск, ул. Максима Богдановича, 5", destination: "Минск, пр-т Партизанский, 7", distance: 20, cargoVolume: 10, cargoWeight: 13.4, typeOfCargo: .manufacturedGoods)

    let orders = [passengerOrder, deliveryOrder]

}
