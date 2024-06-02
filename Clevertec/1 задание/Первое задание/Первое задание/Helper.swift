//
//  Helper.swift
//  Первое задание
//
//  Created by Karina Kovaleva on 6.12.22.
//

import Foundation
import AVFoundation
import UIKit

struct Helper {
    
    let defaults = UserDefaults.standard

    func currentTheme() -> Mode {
        
        let rawValue = defaults.string(forKey: "ThemeStateEnum") ?? "system"
        
        let currentTheme = Mode(rawValue: rawValue)
        
        return currentTheme!
    }
    
    func updateThemeState(themeChoice: Mode) {
        
        switch themeChoice {
            
        case .system:
            
            // Check the current system mode and change to it app wide
            
            if UIScreen.main.traitCollection.userInterfaceStyle == .dark {
                
                UserInterfaceStyleManager.shared.updateUserInterfaceStyle(true)
                
            } else {
                
                UserInterfaceStyleManager.shared.updateUserInterfaceStyle(false)
                
            }
            
        case .light:
            
            UserInterfaceStyleManager.shared.updateUserInterfaceStyle(false)
            
        case .dark:
            
            
            UserInterfaceStyleManager.shared.updateUserInterfaceStyle(true)
        }
        
        defaults.set(themeChoice.rawValue, forKey: "ThemeStateEnum")
        
     }
    
}


    


