//
//  Structs.swift
//  HomeWork_API
//
//  Created by Karina Kovaleva on 29.11.22.
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
    var url: URL
    var thumbnailUrl: URL
}

struct FinalPhotos {
    var user: User
    let albumID: Int
    var title: String
    var url: URL
    var thumbnailUrl: URL
}
