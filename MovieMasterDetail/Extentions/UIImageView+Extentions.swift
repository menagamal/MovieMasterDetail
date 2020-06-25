//
//  UIImageView+Extentions.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/25/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
extension UIImageView{
   public func setImageWithUrl(url: String, comp:@escaping((_ img:UIImage?,_ error:Error?)->Void)){
        self.sd_setShowActivityIndicatorView(true)
        self.sd_showActivityIndicatorView()
        
        if #available(iOS 13.0, *) {
            self.sd_setIndicatorStyle(.medium)
        } else {
            self.sd_setIndicatorStyle(.gray)
        }
        if let imageURL = URL(string: url){
            //self.sd_setImage(with: imageURL, completed: nil)
            self.sd_setImage(with: imageURL) { (img, e, cache, url) in
                comp(img,e)
            }
          
        }
    }
    
   public func mirrorImageView() {
        if let image = self.image {
            self.image = UIImage(cgImage: image.cgImage!, scale: image.scale , orientation: .upMirrored)
        }
    }
}
