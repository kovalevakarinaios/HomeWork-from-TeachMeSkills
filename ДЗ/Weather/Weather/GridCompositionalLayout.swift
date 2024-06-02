//
//  GridCompositionalLayout.swift
//  Weather
//
//  Created by Karina Kovaleva on 2.12.22.
//

import UIKit

enum SupplementaryElements {
    static let collectionHeader = "collection-header"
    static let sectionHeader = "section-header"
    static let sectionSpacer = "sectionSpacer"
}

enum GridCompositionalLayout {
    func generateLayout() -> UICollectionViewCompositionalLayout {
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.boundarySupplementaryItems = [makeCollectionHeader()]
        
        return UICollectionViewCompositionalLayout(
            sectionProvider: { section, _ in
                
                if section % 2 == 0 {
                    return makeLetterSection()
                }
                return makeSection()
            },
            configuration: config
        )
    }
    
    func makeItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalWidth(0.5)
            )
        )
        item.contentInsets = .init(top: 0, leading: 2, bottom: 2, trailing: 2)
        
        return item
    }
    
    func makeBigItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            )
        )
        item.contentInsets = .init(top: 0, leading: 2, bottom: 0, trailing: 2)
        
        return item
    }
    
    func makeGroup() -> NSCollectionLayoutGroup {
        let group =  NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(0.5)
            ),
            subitems: [makeItem()]
        )
        
        group.contentInsets = .init(top: 0, leading: 2, bottom: 4, trailing: 2)
        
        let groupWithBigElement = NSCollectionLayoutGroup.horizontal(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1)
            ),
            subitems: [makeBigItem()]
        )
        
        groupWithBigElement.contentInsets = .init(top: 0, leading: 2, bottom: 4, trailing: 2)
        
        
        let compositionalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalWidth(1.5)
            ),
            subitems: [group, groupWithBigElement]
        )
        
        return compositionalGroup
    }
    
    func makeSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(32)
            ),
            elementKind: SupplementaryElements.sectionHeader,
            alignment: .top
        )
    }
    
   func makeCollectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(32)
            ),
            elementKind: SupplementaryElements.collectionHeader,
            alignment: .top
        )
    }
    
    func makeSpacer() -> NSCollectionLayoutBoundarySupplementaryItem {
        return NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(60)
            ),
            elementKind: SupplementaryElements.sectionSpacer,
            alignment: .top
        )
    }
    
    func makeSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: makeGroup())
        section.contentInsets = .init(
            top: 16,
            leading: 0,
            bottom: 0, trailing: 0
        )
        section.boundarySupplementaryItems = [makeSpacer(), makeSectionHeader()]
        
        return section
    }
    
}

extension GridCompositionalLayout {
    
    func makeLetterItem() -> NSCollectionLayoutItem {
        let item = NSCollectionLayoutItem(
            layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)
            )
        )
        
        item.contentInsets = .init(top: 3, leading: 3, bottom: 3, trailing: 3)
        return item
    }
    
    func makeLetterGroup() -> NSCollectionLayoutGroup {
        let group =  NSCollectionLayoutGroup.vertical(
            layoutSize: .init(
                widthDimension: .fractionalWidth(3/8),
                heightDimension: .fractionalWidth(6/8)
            ),
            subitems: [makeLetterItem()]
        )
        
        return group
    }
    
    func makeLetterSection() -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: makeLetterGroup())
        section.contentInsets = .init(
            top: 16,
            leading: 0,
            bottom: 16,
            trailing: 0
        )
        section.orthogonalScrollingBehavior = .groupPagingCentered
        return section

    }
    
}

