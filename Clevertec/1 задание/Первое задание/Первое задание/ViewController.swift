//
//  ViewController.swift
//  Первое задание
//
//  Created by Karina Kovaleva on 6.12.22.
//

import UIKit

enum Mode: String {
    case system
    case light
    case dark
}

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var languagePicker: UIPickerView = {
        var languagePicker = UIPickerView()
        languagePicker.translatesAutoresizingMaskIntoConstraints = false
        return languagePicker
    }()
    
    var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()
    
    var languageList: [String] = [String]()
    
    var helper = Helper()
    
    lazy var stackViewForModeButtons: UIStackView = {
        var stackViewForModeButtons = UIStackView()
        stackViewForModeButtons.axis = .horizontal
        stackViewForModeButtons.distribution = .fillEqually
        stackViewForModeButtons.alignment = .fill
        stackViewForModeButtons.spacing = 5
        stackViewForModeButtons.translatesAutoresizingMaskIntoConstraints = false
        [self.darkModeButton, self.lightModeButton, self.autoModeButton].forEach { stackViewForModeButtons.addArrangedSubview($0) }
        
        return stackViewForModeButtons
    }()
    
    
    var darkModeButton: UIButton = {
        var darkModeButton = UIButton(frame: CGRectZero)
        darkModeButton.translatesAutoresizingMaskIntoConstraints = false
        darkModeButton.setTitle("Dark", for: .normal)
        darkModeButton.tintColor = .black
        darkModeButton.setTitleColor(.black, for: .normal)
        return darkModeButton
    }()
    
    var lightModeButton: UIButton = {
        var lightModeButton = UIButton(frame: CGRectZero)
        lightModeButton.translatesAutoresizingMaskIntoConstraints = false
        lightModeButton.setTitle("Light", for: .normal)
        lightModeButton.setTitleColor(.black, for: .normal)
        return lightModeButton
    }()
    
    var autoModeButton: UIButton = {
        var autoModeButton = UIButton(frame: CGRectZero)
        autoModeButton.translatesAutoresizingMaskIntoConstraints = false
        autoModeButton.setTitle("Auto", for: .normal)
        autoModeButton.tintColor = .black
        autoModeButton.setTitleColor(.black, for: .normal)
        return autoModeButton
    }()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(stackViewForModeButtons)
        self.view.addSubview(languagePicker)
        self.view.addSubview(label)
        
        languagePicker.dataSource = self
        languagePicker.delegate = self
        languageList = ["English", "Russian", "Belarusian"]
        
//        darkModeButton.addTarget(self, action: #selector(<#T##@objc method#>), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.widthAnchor.constraint(equalToConstant: 100),
            languagePicker.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            languagePicker.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            languagePicker.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            stackViewForModeButtons.bottomAnchor.constraint(equalTo: label.topAnchor, constant: -20),
            stackViewForModeButtons.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 70),
            stackViewForModeButtons.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            stackViewForModeButtons.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
        ])
        
        let rawValue = defaults.string(forKey: "ThemeStateEnum") ?? "system"
        
        let currentTheme = Mode(rawValue: rawValue)
        
//        switch currentTheme {
//
//        case .system:
//
//            themeChoice.selectedSegmentIndex = 0
//
//        case .light:
//
//            themeChoice.selectedSegmentIndex = 1
//
//        case .dark:
//
//            themeChoice.selectedSegmentIndex = 2
//
//        default:
//
//            break
//        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        languageList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        languageList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if languageList[row] == "English" {
            changeLanguage(lang: "en")
        } else if languageList[row] == "Russian" {
            changeLanguage(lang: "ru")
        } else if languageList[row] == "Belarusian" {
            changeLanguage(lang: "be")
        }
    }
    
    func changeLanguage(lang: String) {
        label.text = "greeting".localizeString(string: lang)
    }
}
