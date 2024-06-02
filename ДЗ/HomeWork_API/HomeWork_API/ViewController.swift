//
//  ViewController.swift
//  HomeWork_API
//
//  Created by Karina Kovaleva on 29.11.22.
//

import UIKit
import SDWebImage

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell()
        cell.imageView?.sd_setImage(with: self.model.finalPhotos[indexPath.row].url)
        cell.textLabel?.text = model.finalPhotos[indexPath.row].user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.finalPhotos.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        model.deleteRequest(row: indexPath.row)
    }
    
    @IBAction func addResource(_ sender: UIBarButtonItem) {
        model.postRequest()
    }
}
