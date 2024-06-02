//
//  ContentView.swift
//  lesson 2 swiftui
//
//  Created by Karina Kovaleva on 12.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = Model()
    @State var text: String = ""
    @State var count: String = ""
    
    var body: some View {
        VStack {
            Text("\(model.time)")
            Text(model.arrayOfStrings.last ?? "") 
            Text("\(model.photos.count)")
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(text)
            Button("Press me") {
                model.int.value += 1
            }
            .onReceive(model.string) { string in
                text = string
            }
        }
        .padding()
        .onAppear {
            model.load()
            model.loadData()
            model.loadArray()
            model.loadInt()
            model.loadTimer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
