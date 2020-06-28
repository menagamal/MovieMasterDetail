//
//  PhotoResponse.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
class PhotoResponse : NSObject, Codable, NSCoding  {
   
    var photo : [Photo]?

    enum CodingKeys: String, CodingKey {

        case photo = "photo"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        photo = try values.decodeIfPresent([Photo].self, forKey: .photo)
    }

    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
            coder.encode(self.photo, forKey: "photo")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        self.photo = coder.decodeObject(forKey: "photo") as? [Photo]
        
    }
    
}
