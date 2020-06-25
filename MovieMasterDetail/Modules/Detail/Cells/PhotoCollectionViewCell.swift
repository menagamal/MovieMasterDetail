//
//  PhotoCollectionViewCell.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoIImageView: UIImageView!
    
    func setDetails(url:String)  {
        photoIImageView.setImageWithUrl(url: url) { (img, error) in
            if error == nil {
                // delegate the image to object
            }
        }
    }

}
