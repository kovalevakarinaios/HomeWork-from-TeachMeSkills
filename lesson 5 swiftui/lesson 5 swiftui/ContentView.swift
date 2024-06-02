//
//  ContentView.swift
//  lesson 5 swiftui
//
//  Created by Karina Kovaleva on 14.12.22.
//

import SwiftUI


enum TabViewSelectionType: Hashable, Codable {
    case first
}

//enum SelectionType: Hashable {
//    case first
//    case second
//    case third
//}
//
//
//struct ContentView: View {
//    @State var selection: SelectionType = .second
//
//    var body: some View {
//        Picker("Picker View", selection: $selection) {
//            Text("English").tag(SelectionType.first)
//            Text("Russian").tag(SelectionType.second)
//            Text("Chinese").tag(SelectionType.third)
//        }
//        .pickerStyle(.segmented)
//    }
//}

//struct ContentView: View {
//
//    var body: some View {
//        Form {
//            Section("First Section") {
//                TextField("text", text: .constant(""))
//                Button("Button") {
//                    print("Tapped")
//                }
//            }
//            Section("Second Section") {
//                Text("Text")
//                Toggle("Toogle", isOn: .constant(false))
//            }
//        }
//        .formStyle(.grouped)
//    }
//}
struct FirstView: View {

    @EnvironmentObject var model: Model

    var body: some View {
        Text("First")
        .navigationTitle("First")
    }
}

struct ContentView: View {
    
    @StateObject var model = Model()
    @State var login: String = ""
    @State var password: String = ""
    @State var isSecured: Bool = true
    
    var body: some View {
        NavigationStack(path: $model.path) {
            Form {
                Section("User Info") {
                    TextField("Enter a login", text: $login) {
                        if login == "Karina" {
                            model.path.append(TabViewSelectionType.first)
                        }
                    }
                    HStack {
                        if isSecured {
                            SecureField("Enter a password", text: $password)
                        } else {
                            TextField("Enter a password", text: $password)
                        }
                        Button(action: {
                            isSecured.toggle()
                        }) {
                            Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                .accentColor(.gray)
                        }
                    }
                }
            }
            .navigationDestination(for: TabViewSelectionType.self) { type in
                switch type {
                case .first : FirstView()
                }
            }
            .environmentObject(model)
        }
    }
}

class Model: ObservableObject {
    @Published var path: NavigationPath = .init()
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
