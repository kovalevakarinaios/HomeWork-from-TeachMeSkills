//
//  ContentView.swift
//  lesson 4 swiftui
//
//  Created by Karina Kovaleva on 14.12.22.
//

import SwiftUI

//enum TabViewSelectionType: Hashable, Codable {
//    case first
//    case second
//    case third
//    case fourth
//}
//
//struct FirstView: View {
//
//    @EnvironmentObject var model: Model
//
//    var body: some View {
//        Text("First")
//        Button("Press me") {
//            model.path.append(TabViewSelectionType.second)
//        }
//        .navigationTitle("First")
//    }
//}
//
//struct SecondView: View {
//
//    @EnvironmentObject var model: Model
//
//    var body: some View {
//        Text("Second")
//        Button("Press me") {
//            model.path.append(TabViewSelectionType.third)
//        }
//            .navigationTitle("Second")
//    }
//}
//
//struct ThirdView: View {
//
//    @EnvironmentObject var model: Model
//
//    var body: some View {
//        Text("Third")
//        Button("Press me") {
//            model.path.append(TabViewSelectionType.fourth)
//        }
//            .navigationTitle("Third")
//    }
//}
//
//struct FourthView: View {
//
//    @EnvironmentObject var model: Model
//
//    var body: some View {
//        Text("Fourth")
//        Button("Press me") {
//            model.path.removeLast(3)
//        }
//            .navigationTitle("Fourth")
//    }
//}
//
//class Model: ObservableObject {
//    @Published var path: NavigationPath = .init()
//}

//struct ContentView: View {
    
    //    @StateObject var model = Model()
    
//    var body: some View {
                NavigationStack(path: $model.path) {
                    Button("Press me", action: {
                        model.path.append(TabViewSelectionType.first)
                    })
                    .navigationDestination(for: TabViewSelectionType.self) { type in
                        switch type {
                        case .first : FirstView()
                        case .second : SecondView()
                        case .third : ThirdView()
                        case .fourth : FourthView()
                        }
                    }
        //            .environmentObject(model)
//        NavigationSplitView(columnVisibility: .constant(.all)) {
//            Text("SideBar")
//        } content: {
//            Text("Content")
//        } detail: {
//            Text("Detail")
//        }
//    }
//}

struct ContentView: View {
    
    @State var isPresented: Bool = false
    
    var body: some View {
        Button("Press me") {
            isPresented.toggle()
        }
        alert("Alert", isPresented: $isPresented) {
            Button("Ok") {
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
