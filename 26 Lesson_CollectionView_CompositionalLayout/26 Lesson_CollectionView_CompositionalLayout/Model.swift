//
//  Model.swift
//  26 Lesson_CollectionView_CompositionalLayout
//
//  Created by Karina Kovaleva on 2.11.22.
//

import Foundation

protocol Model: AnyObject {
    var cats: [Cat] { get set }
}

class ViewControllerModel: Model {
    
    weak var viewController: ViewControllerProtocol?
    
    var cats: [Cat] = [
        Cat(name: "Vasya", dateOfBirth: Date()),
        Cat(name: "Boris", dateOfBirth: Date(timeIntervalSinceNow: -100000)),
        Cat(name: "Oscar", dateOfBirth: Date(timeIntervalSinceNow: -100000000)),
        Cat(name: "Marsel", dateOfBirth: Date(timeIntervalSinceNow: -100000000)),
        Cat(name: "Barsik", dateOfBirth: Date(timeIntervalSinceNow: -9000000)),
        Cat(name: "Alisa", dateOfBirth: Date(timeIntervalSinceNow: -9990000))]
}
