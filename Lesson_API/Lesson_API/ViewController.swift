//
//  ViewController.swift
//  Lesson_API
//
//  Created by Karina Kovaleva on 16.11.22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.viewController = self
        model.loadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123") ?? UITableViewCell()
        cell.textLabel?.text = model.posts[indexPath.row].title
        model.loadImage(imageURL: "https://via.placeholder.com/600/771796") { result in
            switch result {
            case .success(let image):
                cell.imageView?.image = image
            case .failure(let error):
                print(error)
                cell.imageView?.image = UIImage(systemName: "figure.fall")
            }
        }
        return cell
    }
    
}
