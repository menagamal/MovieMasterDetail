//
//  MovieTableViewCell.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    func setDetails(movie:Movie){
        labelTitle.text = movie.title ?? ""
    }
}
