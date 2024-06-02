//
//  ContentView.swift
//  lesson swiftui
//
//  Created by Karina Kovaleva on 7.12.22.
//

import SwiftUI

struct ContentView: View {
    
    @State var strings = ["Petya", "Vasya", "Kolya", "Masha"]
    @State var selectedString: String?
    
    //    @State var hello = "Hello, world!"
    //    @StateObject
    //    @Binding
    //    @ObservedObject var model: Model
    @EnvironmentObject var model: Model
    //    @EnvironmentValues //ориентация, тема, volume
    
    
    var body: some View {
        //        VStack() {
        //            VStack() {
        //            Image(systemName: "globe")
        //                .imageScale(.large)
        //                .foregroundColor(.accentColor)
        //            Text(model.hello)
        //            Text(String(model.count))
        //            ContentDetailView(hello: $model.hello, count: $model.count)
        //                Text("123")
        //                .foregroundColor(.red)
        //            }
        //            .frame(width: 100.0, height: 100.0)
        //            .foregroundColor(.blue)
        //            .background(.orange)
        //            .clipShape(Capsule())
        //            .frame(width: 200, height: 200)
        //            .background(.cyan)
        //            .clipShape(Capsule())
        //            .opacity(0.5)
        //            Spacer()
        //        .position(x: 0, y: 0)
        //        .redacted(reason: )
        
        //        .padding()
        //        .onAppear {
        //            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
        //                self.hello = "Hello"
        //            }
        //        }
        //    }
        //        VStack() {
        //            List(strings, id: \.self, selection: $selectedString) {
        //                Text($0)
        //            }
        //            Text(selectedString ?? "Please select row")
        //        }
        VStack() {
            HStack(spacing: 20) {
                Image(systemName: !isSelected ? "trash.slash.circle.fill" : "person")
                    .resizable()
                    .frame(width: 70, height: 70)
                VStack(alignment: .leading, spacing: 25) {
                    Text("Surname")
                        .foregroundColor(.gray)
                        .font(.body)
                    Text("Middle")
                        .foregroundColor(.gray)
                        .font(.body)
                    Text("Last")
                        .foregroundColor(.gray)
                        .font(.body)
                }
                VStack(alignment: .leading, spacing: 10) {
                    TextField("Surname", text: $model.surname)
                        .textFieldStyle(.roundedBorder)
                    TextField("Middle", text: $model.middle)
                        .textFieldStyle(.roundedBorder)
                    TextField("Last", text: $model.last)
                        .textFieldStyle(.roundedBorder)
                }
            }
            Toggle("", isOn: $isSelected)
            Spacer()
        }
        .padding()
    }
    @State var enteredText: String = ""
    @State var isSelected: Bool = false
}
    
    struct ContentDetailView: View {
        
        @Binding var hello: String
        @Binding var count: Int
        @Binding var surname: String
        @Binding var middle: String
        @Binding var last: String
        
        var body: some View {
            Button("Press me") {
                hello = "Hello+"
                count += 1
            }
        }
    }
    
    class Model: ObservableObject {
        @Published var hello = "Hello, world!"
        @Published var count = 0
        @Published var surname = ""
        @Published var middle = ""
        @Published var last = ""
        
        init() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.hello = "Hello"
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .environmentObject(Model())
        }
    }

