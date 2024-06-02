//
//  ViewController.swift
//  lesson realm
//
//  Created by Karina Kovaleva on 5.12.22.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    let storage = RealmStorage()
    var token: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storage.create()
        let user1 = storage.readUser()
        
        let token = user1?.observe { change in
            switch change {
            case .error(_):
                print("Error")
            case .change(let user, let changeProperty):
                print("Change")
            case .deleted:
                print("Deleted")
            }
        }
        
        storage.updateUser(user1!)
        let user2 = storage.readUser()
//        storage.deleteUser(user2!)
        let selectedUser = storage.readSelectedUsers()
        
    }


}

