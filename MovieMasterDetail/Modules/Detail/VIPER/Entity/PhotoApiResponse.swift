//
//  PhotoApiResponse.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/27/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
struct PhotoApiResponse : Codable {
    let photos : PhotoResponse?
    let stat : String?

    enum CodingKeys: String, CodingKey {

        case photos = "photos"
        case stat = "stat"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        photos = try values.decodeIfPresent(PhotoResponse.self, forKey: .photos)
        stat = try values.decodeIfPresent(String.self, forKey: .stat)
    }

}
