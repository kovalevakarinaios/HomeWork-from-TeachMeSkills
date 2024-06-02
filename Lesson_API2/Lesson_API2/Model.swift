//
//  Model.swift
//  Lesson_API2
//
//  Created by Karina Kovaleva on 16.11.22.
//

import Foundation
import UIKit

class Model {
    
    let group = DispatchGroup()
    
    weak var viewController: ViewController?
    
    var users: [User] = [] {
        didSet {
            viewController?.tableView.reloadData()
        }
    }
    
    var photos: [Photos] = [] {
        didSet {
            viewController?.tableView.reloadData()
        }
    }
    
    var finalPhotos: [FinalPhotos] = [] {
        didSet {
            viewController?.tableView.reloadData()
        }
    }

    func loadData() {
        guard let urlUser = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        var urlUserRequest = URLRequest(url: urlUser, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        urlUserRequest.httpMethod = "GET" // post, delete, put
        group.enter()
        
        URLSession.shared.dataTask(with: urlUserRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            var users: [User] = []
            do {
                users = try JSONDecoder().decode([User].self, from: data)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self?.users = users
            }
            self?.group.leave()
        }
        .resume()
        
        guard let urlPhotos = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        var urlPhotosRequest = URLRequest(url: urlPhotos, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        urlUserRequest.httpMethod = "GET"
        group.enter()
        
        URLSession.shared.dataTask(with: urlPhotosRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            var photos: [Photos] = []
            do {
                photos = try JSONDecoder().decode([Photos].self, from: data)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                self?.photos = photos
            }
            self?.group.leave()
        }
        .resume()
    }
    
    func replaceData() {
        group.notify(queue: DispatchQueue.main) { [unowned self] in
            for i in 0...9 {
                self.finalPhotos.append(FinalPhotos(user: self.users[i], albumId: <#T##Int#>, id: <#T##Int#>, title: <#T##String#>, url: <#T##String#>, thumbnailUrl: <#T##String#>))
            }
        }
    }
}
