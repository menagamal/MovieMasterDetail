//
//  PhotoCollectionViewCellDataSource.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import UIKit

class PhotoCollectionViewCellDataSource: NSObject ,UICollectionViewDataSource{
    
    var collection:UICollectionView!
    var urls = [NSURL]()
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,urls:[NSURL]) {
        super.init()
        
        
        self.urls = urls
        
        self.collection = collection
        
        self.collection.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.collection.dataSource = self
        
        self.collection.delegate = self
        setupCollectionViewLayout()
       //setLayout()
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell",for: indexPath) as! PhotoCollectionViewCell
        cell.setDetails(url: urls[indexPath.row])
        return cell
    }
    func setupCollectionViewLayout() {

        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()

        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 3.0
        layout.minimumInteritemSpacing = 3.0

        // Set the waterfall layout to your collection view
        self.collection.collectionViewLayout = layout
    }
    
}


extension PhotoCollectionViewCellDataSource: CHTCollectionViewDelegateWaterfallLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: collectionView.frame.height/2)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, columnCountFor section: Int) -> Int {
        return 2
    }
    
}
