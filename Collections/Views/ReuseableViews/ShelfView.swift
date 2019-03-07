//
//  ShelfView.swift
//  Collections
//
//  Created by Hitesh Agarwal on 07/03/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class ShelfView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "Apple-Wood"))
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 0.5)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
