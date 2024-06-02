//
//  ViewController.swift
//  25 Lesson
//
//  Created by Karina Kovaleva on 31.10.22.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.minimumLineSpacing = 50
        flowLayout.minimumInteritemSpacing = 50
        flowLayout.itemSize = .init(width: 100, height: 100)
        flowLayout.sectionInset = .init(top: 50, left: 50, bottom: 50, right: 50)
        flowLayout.scrollDirection = .horizontal
        flowLayout.collectionView?.isPagingEnabled = true
        // следующее занятие
        let layout = UICollectionViewCompositionalLayout(section: <#T##NSCollectionLayoutSection#>)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.contentView.backgroundColor = .red
        return cell
    }
}
