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
    var photos = [Photo]()
    var delegate:PhotoCellDelegate?
    
    override init() {
        super.init()
    }
    
    init(collection:UICollectionView,photos:[Photo],delegate:PhotoCellDelegate) {
        super.init()
        
        
        self.photos = photos
        self.delegate = delegate
        self.collection = collection
        
        self.collection.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        self.collection.dataSource = self
        
        self.collection.delegate = self
        setupCollectionViewLayout()
       //setLayout()
        
    }

    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell",for: indexPath) as! PhotoCollectionViewCell
        let base64 = photos[indexPath.row].base64
        if !base64.isEmpty {
            cell.setDetails(with: base64)
        } else {
            if let url = photos[indexPath.row].url {
                cell.setDetails(url: url, completation: { img in
                    let imageData = img.pngData()
                    let imageToBaseStr = imageData!.base64EncodedString(options: .lineLength76Characters)
                    self.delegate?.cacheImage(index:indexPath.row, base64: imageToBaseStr)
                })
            }
            
        }
        
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


protocol PhotoCellDelegate {
    func cacheImage(index:Int,base64:String)
}
