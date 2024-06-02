//
//  Storage.swift
//  lesson coredata
//
//  Created by Karina Kovaleva on 30.11.22.
//

import CoreData

class Storage {

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "lesson_coredata")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    // CRUD
    
    func createUser(_ name: String) {
        let user = User(context: persistentContainer.viewContext)
        user.name = name
        user.birthday = Date()
        user.isSelected = Bool.random()
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("ViewContext didn't save")
        }
    }
    
    func readUser() -> [User] {
        let fetchRequest = User.fetchRequest()
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            persistentContainer.viewContext.rollback()
            print("ViewContext didn't read")
            return []
        }
    }
    
    func updateUser() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("ViewContext didn't update")
        }
    }
    
    func deleteUser(_ user: User) {
        persistentContainer.viewContext.delete(user)
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("ViewContext didn't delete")
        }
    }
    
    func getUser(_ number: Int = 10) -> [User] {
        let fetchRequest = User.fetchRequest()
        fetchRequest.fetchLimit = number
        fetchRequest.fetchOffset = 0
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \User.name, ascending: true)]
        return try! persistentContainer.viewContext.fetch(fetchRequest)
    }
    
    func getSelectedUser() -> [User] {
        let predicate = NSPredicate(format: "%K == YES", #keyPath(User.isSelected))
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = predicate
        return try! persistentContainer.viewContext.fetch(fetchRequest)
    }
}
