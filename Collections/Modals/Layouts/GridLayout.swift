//
//  GridLayout.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class GridLayout: UICollectionViewFlowLayout {
    override init() {
        super.init()
        
        self.minimumLineSpacing = 10
        minimumInteritemSpacing = 10
        itemSize = CGSize(width: 170, height: 197)
        scrollDirection = .vertical
        headerReferenceSize = CGSize(width: 50, height: 50)
        footerReferenceSize = CGSize(width: 44, height: 44)
        self.register(ShelfView.classForCoder(), forDecorationViewOfKind: ShelfView.className)
    }
}
