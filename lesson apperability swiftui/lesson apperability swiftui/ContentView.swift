//
//  ContentView.swift
//  lesson apperability swiftui
//
//  Created by Karina Kovaleva on 28.12.22.
//

import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            UIKitLabel()
                .background(.red)
//           UIKitCollectionView()
            UIKitTableView { a in
                print(a)
            }
        }
        .padding()
    }
}

struct UIKitLabel: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UILabel {
        return UILabel()
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = "123"
        uiView.tintColor = .yellow
        uiView.layer.cornerRadius = 10
        uiView.layer.masksToBounds = true
    }

}

//struct UIKitButton: UIViewRepresentable {
//
//    var action: () -> Void?
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator()
//    }
//
//    func makeUIView(context: Context) -> UIButton {
//        let button = UIButton()
//        button.addTarget(self, action: #selector(Coordinator.tap), for: .touchUpInside)
//        return button
//    }
//
//    func updateUIView(_ uiView: UIButton, context: Context) {
//        uiView.setTitle("Tap", for: .normal)
//        context.coordinator.action = self.action
//    }
//}
//
//class Coordinator: NSObject {
//
//    var action: () -> Void?
//
//    @objc func tap() {
//        print("tap")
//    }
//}

//struct UIKitCollectionView: UIViewRepresentable {
//
//    var array: [Int] = [1, 2, 3, 4, 5]
//
//    func makeCoordinator() -> CoordinatorCollectionView {
//        return CoordinatorCollectionView()
//    }
//
//    func makeUIView(context: Context) -> UICollectionView {
//        let flowlayout = UICollectionViewFlowLayout()
//        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
//        collectionview.delegate = context.coordinator
//        collectionview.dataSource = context.coordinator
//        collectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "123")
//        return collectionview
//    }
//
//    func updateUIView(_ uiView: UICollectionView, context: Context) {
//        context.coordinator.array2 = self.array
//        uiView.reloadData()
//    }
//
//
//}

struct UIKitTableView: UIViewRepresentable {

    var action: (Int) -> Void
    var array: [Int] = [1, 2, 3, 4, 5]
    var getNumber = Int()
    
    func makeCoordinator() -> CoordinatorTableView {
        return CoordinatorTableView()
    }
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.delegate = context.coordinator
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "123")
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.array2 = self.array
        context.coordinator.action = self.action
        uiView.reloadData()
    }
    
}

class CoordinatorTableView: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    var action: ((Int) -> Void)?
    var array2: [Int] = []
    var getnumber = Int()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        array2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
//        var config = UIListContentConfiguration.cell()
//        config.text = "\(array2[indexPath.row])"
//        cell.contentConfiguration = config
        cell.contentConfiguration = UIHostingConfiguration(content: {
            VStack{
                Text("\(array2[indexPath.row])")
                Text("Lelel")
            }
        })
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        getnumber = array2[indexPath.row]
        action!(getnumber)
    }
}

//class CoordinatorCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
//
//    var array2: [Int] = []
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return array2.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "123", for: indexPath)
//        var configuaration = UIListContentConfiguration.cell()
//        configuaration.text = "\(array2[indexPath.row])"
//        cell.contentConfiguration = configuaration
//        return cell
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
