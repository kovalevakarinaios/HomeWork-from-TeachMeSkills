//
//  Structs.swift
//  Lesson_API2
//
//  Created by Karina Kovaleva on 16.11.22.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var username: String
    var email: String
}

struct Photos: Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}

struct FinalPhotos {
    var user: User
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
}
