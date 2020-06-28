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
    
    func setDetails(url:NSURL,completation:@escaping((_ image:UIImage)->Void))  {
        
        self.photoIImageView.sd_setImage(with: url as URL?, completed: { (img, error, s, u) in
            if let img = img {
                // delegate the image to object
                completation(img)
            }
        })
    }
    
    func setDetails(with base64:String) {
        let dataDecoded : Data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters)!
        let decodedimage:UIImage = UIImage(data: dataDecoded)!
        self.photoIImageView.image = decodedimage
    }
    
}
