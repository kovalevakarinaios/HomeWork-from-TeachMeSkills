//
//  ViewController.swift
//  26 Lesson_CollectionView_CompositionalLayout
//
//  Created by Karina Kovaleva on 2.11.22.
//

import UIKit

enum Section: Hashable {
    case main
    case recent
}

struct Cat: Hashable {
    let name: String
    let dateOfBirth: Date
}

protocol ViewControllerProtocol: AnyObject {
    func updateData()
}

class ViewController: UIViewController , ViewControllerProtocol {
    
    func updateData() {
        <#code#>
    }
    
    lazy var model: Model = {
        let model = ViewControllerModel()
        model.viewController = self
        return model
    }()

    var collectionView: UICollectionView!

    var catsDataSource: UICollectionViewDiffableDataSource<Section, Cat>!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience init(model: ViewControllerModel) {
        self.init()
        self.model = model
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: generateCollectionViewLayout())
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
        createDataSource()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadData()
    }
    
    func loadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Cat>()
        snapshot.appendSections([.main])
        snapshot.appendItems(model.cats, toSection: .main)
        catsDataSource.applySnapshotUsingReloadData(snapshot)
    }
    
    func createDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, Cat> { cell, indexPath, itemIdentifier in
            var configuration = UIListContentConfiguration.cell()
            configuration.text = itemIdentifier.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .short
            configuration.secondaryText = dateFormatter.string(from: itemIdentifier.dateOfBirth)
            cell.contentConfiguration = configuration
        }
        catsDataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
            return cell
        }
    }
    
    func generateCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider = { (int: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
            //            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            //            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1/8))
            //            let collectionLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
            //            return NSCollectionLayoutSection(group: collectionLayoutGroup)
            //        }
            let smallSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3))
            let smallItem = NSCollectionLayoutItem(layoutSize: smallSize)
//            smallItem.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
            let smallGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/4), heightDimension: .fractionalHeight(1))
//            let smallLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: smallGroupSize, subitem: smallItem, count: 2)
            let smallLayoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: smallGroupSize, subitems: [smallItem])
//            smallLayoutGroup.interItemSpacing = .fixed(10)
            let bigSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(3/4), heightDimension: .fractionalHeight(1))
            let bigItem = NSCollectionLayoutItem(layoutSize: bigSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/4))
            let collectionLayoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [bigItem, smallLayoutGroup])
            let section = NSCollectionLayoutSection(group: collectionLayoutGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
