//
//  ViewController.swift
//  Collections
//
//  Created by Hitesh  Agarwal on 3/7/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad() 
        configureView()
    }
    
    func configureView() {
        collectionView.dataSource = CocoaConf.all
        collectionView.reloadData()
        
        let image = #imageLiteral(resourceName: "Wood-Planks")
        let color = UIColor(patternImage: image)
        collectionView.backgroundColor = color
    }
}

