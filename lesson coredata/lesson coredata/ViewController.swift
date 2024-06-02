//
//  ViewController.swift
//  lesson coredata
//
//  Created by Karina Kovaleva on 30.11.22.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let storage = Storage()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage.createUser("Vasya")
        storage.createUser("Karina")
        storage.createUser("Petya")
        storage.createUser("Kolya")
        storage.createUser("Artem")
        storage.createUser("Vasya")

//        let user = storage.readUser().first
        let users = storage.getSelectedUser()
        // NSFetchedResultsController домашка
//        user?.isSelected.toggle()
//        storage.updateUser()
//        storage.deleteUser(user!)
    }
    
    @IBAction func addUser(_ sender: Any) {
       createAlert()
    }
    
    func createAlert() {
        let alert = UIAlertController(title: "Add User", message: "Submit something", preferredStyle: .alert)
        alert.addTextField { (textField: UITextField) in
              textField.keyboardAppearance = .dark
              textField.keyboardType = .default
              textField.autocorrectionType = .default
              textField.placeholder = "Name"
              textField.clearButtonMode = .whileEditing
          }
        
        let submitAction = UIAlertAction(title: "Submit", style: .default, handler: { [unowned self] action -> Void in
            let textFieldText = alert.textFields![0].text
            storage.createUser(textFieldText!)
            storage.updateUser()
            tableView.reloadData()
          })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive)
        present(alert, animated: true)
        alert.addAction(submitAction)
        alert.addAction(cancel)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storage.readUser().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.textLabel?.text = storage.readUser()[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        storage.deleteUser(storage.readUser()[indexPath.row])
        tableView.reloadData()
    }
}

