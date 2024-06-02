//
//  Extension+String.swift
//  Первое задание
//
//  Created by Karina Kovaleva on 6.12.22.
//

import Foundation

extension String {
    func localizeString(string: String) -> String {
           let path = Bundle.main.path(forResource: string, ofType: "lproj")
           let bundle = Bundle(path: path!)
           return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
       }
}
