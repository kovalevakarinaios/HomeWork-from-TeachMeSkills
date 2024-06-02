//
//  StorageRealm.swift
//  lesson realm
//
//  Created by Karina Kovaleva on 5.12.22.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @Persisted var name: String // persisted wrapper
    @Persisted var birthday: Date
    @Persisted var isSelected: Bool
    @Persisted var pet: RealmPet?
    
    convenience init(name: String, birthday: Date, isSelected: Bool) {
        self.init()
        self.name = name
        self.birthday = birthday
        self.isSelected = isSelected
    }
}

class RealmPet: Object  {
    @Persisted var name: String // persisted wrapper
    @Persisted var birthday: Date
    @Persisted var isSelected: Bool
}

class RealmStorage {
    // CRUD
    let realm = try! Realm()
    func create() {
        let user = RealmUser(name: "Vasya", birthday: Date(), isSelected: Bool.random())
        let pet = RealmPet()
        pet.name = "Bobik"
        user.pet = pet
        try! realm.write({
            realm.add(user)
        })
    }
    
    func readUser() -> RealmUser? {
        realm.objects(RealmUser.self).last
    }
    
    func updateUser(_ user: RealmUser) {
        try! realm.write {
            user.isSelected.toggle()
        }
    }
    
    func deleteUser(_ user: RealmUser) {
        try! realm.write {
            realm.delete(user)
        }
    }
    
    func readSelectedUsers() -> [RealmUser] {
        let result = realm.objects(RealmUser.self).where{ $0.isSelected == true }
        var users: [RealmUser] = []
        for i in 0...result.count - 1 {
            users.append(result[i])
        }
        return users
    }
}
