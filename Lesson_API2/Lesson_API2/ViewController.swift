//
//  ViewController.swift
//  Lesson_API2
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
        model.replaceData()
        
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123") ?? UITableViewCell()
        cell.textLabel?.text = model.finalPhotos[indexPath.row].user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.finalPhotos.count
    }

}

