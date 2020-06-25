//
//  PhotoCollectionViewCellDataSource.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import WaterfallLayout
import UIKit

class PhotoCollectionViewCellDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    
    var collection:UICollectionView!
    var urls = [String]()
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,urls:[String]) {
        super.init()
        
        
        self.urls = urls
        
        self.collection = collection
        
        self.collection.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        self.collection.dataSource = self
        
        self.collection.delegate = self
        setLayout()
        
    }
    
    func setLayout()  {
        let layout = WaterfallLayout()
        layout.delegate = self
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 8.0
        layout.minimumInteritemSpacing = 8.0
        layout.headerHeight = 50.0
        collection.collectionViewLayout = layout
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell",for: indexPath) as! PhotoCollectionViewCell
        //cell.setDetails(url: urls[indexPath.row])
        return cell
    }
    
}

extension PhotoCollectionViewCellDataSource:WaterfallLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: WaterfallLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
    func collectionViewLayout(for section: Int) -> WaterfallLayout.Layout {
        return .waterfall(column: 2, distributionMethod: .equal)
    }
    
    
}
