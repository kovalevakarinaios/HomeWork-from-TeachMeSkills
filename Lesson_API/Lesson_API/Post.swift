//
//  Post.swift
//  Lesson_API
//
//  Created by Karina Kovaleva on 16.11.22.
//

import Foundation

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
