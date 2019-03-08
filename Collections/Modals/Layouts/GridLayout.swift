//
//  GridLayout.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    
    var dictRects = [IndexPath: CGRect]()
    var cache = [UICollectionViewLayoutAttributes]()
    
    override init() {
        super.init()
        
        self.minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        itemSize = CGSize(width: 170, height: 197)
        scrollDirection = .vertical
        headerReferenceSize = CGSize(width: 50, height: 50)
        footerReferenceSize = CGSize(width: 44, height: 44)
        sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.register(UINib(nibName: ShelfView.className, bundle: nil), forDecorationViewOfKind: ShelfView.className)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder )
    }
    
    override func prepare() {
        super.prepare()
        
        let sectionsCount = collectionView?.numberOfSections ?? 0
        let availableWidth = collectionViewContentSize.width - (sectionInset.left + sectionInset.right)

        var y:CGFloat = 0
        for section in 0..<sectionsCount {
            
            // Set Header View
//            let headerLayoutAttribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: ConferenceHeader.className, with: IndexPath(row: 0, section: section))
//            headerLayoutAttribute.frame = CGRect(origin: CGPoint(x: headerLayoutAttribute.frame.origin.x, y: y), size: headerLayoutAttribute.frame.size)
//            cache.append(headerLayoutAttribute)
            
            y += headerReferenceSize.height + sectionInset.top
            //Set Cell Size
            let rowsCount = collectionView?.numberOfItems(inSection: section) ?? 0
            for row in 0..<rowsCount {
                let x = (availableWidth / 2) - (itemSize.width / 2)
                
                let indexPath = IndexPath(row: row, section: section)
                let layoutAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
                layoutAttribute.frame = CGRect(origin: CGPoint(x: x, y: y), size: itemSize)
                cache.append(layoutAttribute)
                
                y += itemSize.height
                y += sectionInset.bottom
            }
            
            //Set FooterView
//            let footerLayoutAttribute = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: StarRatingFooter.className, with: IndexPath(row: 0, section: section))
//            footerLayoutAttribute.frame = CGRect(origin: CGPoint(x: footerLayoutAttribute.frame.origin.x, y: y), size: footerLayoutAttribute.frame.size)
//            cache.append(footerLayoutAttribute)
            y += footerReferenceSize.height
        }
        collectionView?.contentSize.height = y
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var results = [UICollectionViewLayoutAttributes]()
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                results.append(attribute)
            }
        }
        
//        let supplimentryAttributes = (super.layoutAttributesForElements(in: rect) ?? []).filter { (attribute) -> Bool in
//            return attribute.representedElementKind == UICollectionView.elementKindSectionHeader ||
//                attribute.representedElementKind == UICollectionView.elementKindSectionFooter
//        }
//        results.append(contentsOf: supplimentryAttributes)
        return results
    }
}
