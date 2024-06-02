//
//  ContentView.swift
//  lesson 3 swiftui
//
//  Created by Karina Kovaleva on 12.12.22.
//

import SwiftUI

//struct ContentView: View {
//
//    @State var selectionIndex: Int = 1
//
//    var body: some View {
//        TabView(selection: $selectionIndex) {
//            UserView()
//                .tag(0)
//                badge(2)
//                .tabItem {
//                    Label("User", systemImage: "person")
//                }
//            SettingsView()
//                .tag(1)
//                .tabItem {
//                    Image(systemName: "gear")
//                }
//        }
//        .tabViewStyle(.page)
//    }
//}
//
struct UserView: View {
    var body: some View{
        Text("UserInfo")
    }
}

struct SettingsView: View {
    var body: some View{
        Button("Settings", action: {

        })
    }
}

struct ContentView: View {
    var body: some View {
//        NavigationView {
//            List {
//                NavigationLink("First") {
//                    UserView()
//                }
//            }
//            .navigationTitle("Users")
//        }
        NavigationStack(path: $, root: <#T##() -> _#>) {
            List {
                NavigationLink("First") {
                    UserView()
                }
                NavigationLink("Second") {
                    SettingsView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
