//
//  ViewController.swift
//  Weather_App
//
//  Created by Karina Kovaleva on 2.12.22.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    lazy var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
     
    var models = [Weather]()
    
    let locationManager = CLLocationManager()
    
    var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        // Register 2 cells
        tableView.register(WeatherTableViewCell.nib(), forCellReuseIdentifier: "WeatherTableViewCell")
        tableView.register(HourlyTableViewCell.nib(), forCellReuseIdentifier: "HourlyTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    // Location
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        guard let currentLocation = currentLocation else {
            return
        }
        
        let latitude = round(Double(currentLocation.coordinate.latitude) * 100) / 100
        let longitude = round(Double(currentLocation.coordinate.longitude) * 100) / 100
        guard let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=\(latitude)&longitude=\(longitude)&hourly=temperature_2m,precipitation,weathercode&daily=weathercode,temperature_2m_max,temperature_2m_min,sunrise,sunset,precipitation_hours&current_weather=true&timezone=auto") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) { [unowned self] data, response, error in
            
            // Validation
            guard let data = data else { return }
            
            // Convert data to models/objet
            var json: Weather?
            do {
                json = try JSONDecoder().decode(Weather.self, from: data)
            } catch {
                print(error)
            }
            
            guard let result = json else { return }
            
            
            // UI
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        .resume()
        print("\(longitude) | \(latitude)")
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.id, for: indexPath) as UITableViewCell
        
        return cell
    }
}

