//
//  ViewController.swift
//  lesson contacts
//
//  Created by Karina Kovaleva on 23.11.22.
//

import UIKit
import Contacts

class ViewController: UIViewController {

    let store = CNContactStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.requestAccess(for: .contacts) { isAllowed, error in
            print(isAllowed)
        }
        let keys = [CNContactBirthdayKey, CNContactPhoneNumbersKey, CNContactImageDataKey, CNContactFamilyNameKey] as [CNKeyDescriptor]
        do {
            let predicate = CNContact.predicateForContacts(matchingName: "Kate")
            let contacts = try store.unifiedContacts(matching: predicate, keysToFetch: keys)
            print(contacts)
            
            let contact = CNMutableContact()
            
//            let contact = contacts.first?.mutableCopy() as! CNMutableContact
            contact.imageData = UIImage(systemName: "car.2")?.pngData()
            contact.birthday = contacts.first!.birthday
            contact.phoneNumbers = contacts.first!.phoneNumbers
            contact.familyName = contacts.first!.familyName
            let saveRequest = CNSaveRequest()
            saveRequest.add(contact, toContainerWithIdentifier: nil)
            saveRequest.update(contact)
            try store.execute(saveRequest)
        } catch {
            print(error)
        }
    }
}
