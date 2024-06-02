//
//  ViewController.swift
//  lesson sql
//
//  Created by Karina Kovaleva on 28.11.22.
//

import UIKit
import SQLite3

struct User {
    var id: Int32
    var name: String
    var surname: String
}

let documents = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)

class ViewController: UIViewController {
    
    let databasePath = documents.appendingPathExtension("databaseSQLite").relativePath

    var database: OpaquePointer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database = openDatabase()
        createTable()
        insertData()
        let user = read()
        closeDataBase()
    }
    
    func openDatabase() -> OpaquePointer? {
        var database: OpaquePointer?
        if sqlite3_open(databasePath, &database) == SQLITE_OK {
            print("open - \(databasePath)")
            return database
        } else {
            print("error")
            return nil
        }
    }
    
    func closeDataBase() {
        sqlite3_close_v2(database)
    }
    
    func createTable() {
        let createTableString = """
                CREATE TABLE Users(
                Id INT PRIMARY KEY NOT NULL,
                Name CHAR(255), SURNAME CHAR(255));
                """
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        if sqlite3_prepare_v2(database, createTableString, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table created")
            } else {
                print("Table didn't create")
            }
        } else {
            print("Table didn't prepare")
        }
    }
    
    func insertData() {
        let insertStatementString = "INSERT INTO Users (Id, Name, Surname) VALUES (?, ?, ?);"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        if sqlite3_prepare_v2(database, insertStatementString, -1, &statement, nil) == SQLITE_OK {
            let id: Int32 = 0
            let name: NSString = "Vasya"
            let surname: NSString = "Pupkin"
            sqlite3_bind_int(statement, 1, id)
            sqlite3_bind_text(statement, 2, name.utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, surname.utf8String, -1, nil)
            if sqlite3_step(statement) == SQLITE_DONE {
                print("value added")
            } else {
                print("value didn't add")
            }
        } else {
            print("value didn't prepare")
        }
    }
    
    func read() -> User? {
        let queryStatementString = "SELECT * FROM Users;"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        if sqlite3_prepare_v2(database, queryStatementString, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_ROW {
                let id = sqlite3_column_int(statement, 0)
                let namePointer = sqlite3_column_text(statement, 1)!
                let surnamePointer = sqlite3_column_text(statement, 2)!
                let name = String(cString: namePointer)
                let surname = String(cString: surnamePointer)
                return  User(id: id, name: name, surname: surname)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }
    
    func update() {
        
    }
}
