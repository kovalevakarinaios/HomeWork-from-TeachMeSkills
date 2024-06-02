//
//  File.swift
//  HomeWork10_Karina
//
//  Created by Karina Kovaleva on 13.08.22.
//

import UIKit

extension UIView {
    func getRandomColor () -> UIColor {
        let randomColor = UIColor(red: drand48(), green: drand48(), blue: drand48(), alpha: 1)
        return randomColor
    }
}
