//
//  FourthViewController.swift
//  HomeWork9_Karina
//
//  Created by Karina Kovaleva on 12.08.22.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet var to5VCButton: UIButton!
    @IBOutlet var menuButton: UIButton!
    let number = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        number.center = self.view.center
        self.view.addSubview(number)
        number.text = "4"
        to5VCButton.setTitle("Next", for: .normal)
        menuButton.setTitle("Menu", for: .normal)
        let barButtonMenu = UIMenu(title: "", children: [
            UIAction(title: NSLocalizedString("Copy", comment: ""), image: UIImage(systemName: "doc.on.doc"), handler: {_ in }),
            UIAction(title: NSLocalizedString("Rename", comment: ""), image: UIImage(systemName: "pencil"), handler: {_ in }),
            UIAction(title: NSLocalizedString("Duplicate", comment: ""), image: UIImage(systemName: "plus.square.on.square"), handler: {_ in }),
            UIAction(title: NSLocalizedString("Move", comment: ""), image: UIImage(systemName: "folder"), handler: {_ in }),
            UIAction(title: NSLocalizedString("Delete", comment: ""), image: UIImage(systemName: "trash"), handler: {_ in })
        ])
        menuButton.showsMenuAsPrimaryAction = true
        menuButton.menu = barButtonMenu
    }

    @IBAction func to5VCButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "From4To5", sender: nil )
        self.navigationController?.viewControllers.swapAt(1, 2)
    }
}
