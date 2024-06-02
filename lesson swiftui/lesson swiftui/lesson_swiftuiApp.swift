//
//  lesson_swiftuiApp.swift
//  lesson swiftui
//
//  Created by Karina Kovaleva on 7.12.22.
//

import SwiftUI

@main
struct lesson_swiftuiApp: App {
    
    @StateObject var model = Model()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
