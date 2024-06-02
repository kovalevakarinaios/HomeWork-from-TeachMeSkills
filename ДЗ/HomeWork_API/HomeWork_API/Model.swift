//
//  Model.swift
//  HomeWork_API
//
//  Created by Karina Kovaleva on 29.11.22.
//

import Foundation
import UIKit

class Model {
    
    let group = DispatchGroup()
    
    weak var viewController: ViewController?
    
    var users: [User] = []
    
    var photos: [Photos] = [] 
    
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
        urlPhotosRequest.httpMethod = "GET"
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
                self.finalPhotos.append(FinalPhotos(user: self.users[i], albumID: self.photos[i].albumId, title: self.photos[i].title, url: self.photos[i].url, thumbnailUrl: self.photos[i].thumbnailUrl))
            }
        }
    }

    func postRequest() {
        guard let urlPhotos = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        let photos = ["albumid": 1, "id": 2] // For example
        var urlPhotosRequest = URLRequest(url: urlPhotos)
        urlPhotosRequest.httpMethod = "POST"
        urlPhotosRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpbody = try? JSONSerialization.data(withJSONObject: photos) else { return }
        urlPhotosRequest.httpBody = httpbody
        
        URLSession.shared.dataTask(with: urlPhotosRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            if let response = response {
                print(response)
            }
            do {
                let json = try? JSONSerialization.jsonObject(with: data)
                print(json)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func deleteRequest(row: Int) -> Void {
        guard let urlPhotos = URL(string: "https://jsonplaceholder.typicode.com/photos/\(row + 1)") else { return }
        var urlPhotosRequest = URLRequest(url: urlPhotos)
        urlPhotosRequest.httpMethod = "DELETE"
        urlPhotosRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: urlPhotosRequest) { [weak self] data, response, error in
            do {
                if let jsonObj = String(data: data!, encoding: .utf8) {
                    print(jsonObj)
                    DispatchQueue.main.async {
                        self!.finalPhotos.remove(at: row)
                        self?.viewController?.tableView.reloadData()
                    }
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
}

