//
//  Model.swift
//  Lesson_API
//
//  Created by Karina Kovaleva on 16.11.22.
//

import Foundation
import UIKit

enum ModelError: Error {
    case urlCannotBeCreated
    case imageCannotBeCreated
}

class Model {
    
    weak var viewController : ViewController?
    
    var posts: [Post] = [] {
        didSet {
            viewController?.tableView.reloadData()
        }
    }
    
    lazy var session: URLSession =  {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()
    
    func loadData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 60)
        urlRequest.httpMethod = "GET" // post, delete, put
        
        URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
            guard let data = data else { return }
            var posts: [Post] = []
            do {
                posts = try JSONDecoder().decode([Post].self, from: data)
            } catch {
                print(error)
            }
//
//            print(urlRequest)
//            print("===========")
//            print(response)
//
            DispatchQueue.main.async {
                self?.posts = posts
            }
        }
        .resume()
    }
    
    func loadImage(imageURL: String, completion: @escaping(Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: imageURL) else {
            completion(.failure(ModelError.urlCannotBeCreated))
            return
        }
        var urlRequest = URLRequest(url: url)
//        urlRequest.httpMethod = "HEAD"
        session.dataTask(with: urlRequest) { data, response, error in
            guard var data = data else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            guard let image = UIImage(data: data) else {
                DispatchQueue.main.async {
                    completion(.failure(ModelError.imageCannotBeCreated))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(image))
            }
        }
        .resume()
    }
}
