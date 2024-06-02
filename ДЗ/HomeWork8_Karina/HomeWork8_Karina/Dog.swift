//
//  Dog.swift
//  HomeWork8_Karina
//
//  Created by Karina Kovaleva on 9.08.22.
//

import UIKit

class Dog {
    var color: String
    var breed: String
    var age: Int
    var name: String
    init (name: String, age: Int, color: String, breed: String) {
        self.name = name
        self.age = age
        self.color = color
        self.breed = breed
    }
}
