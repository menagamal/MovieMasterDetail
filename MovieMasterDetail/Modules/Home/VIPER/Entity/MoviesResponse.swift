//
//  MoviesResponse.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
struct MoviesResponse : Codable {
    let movies : [Movie]?

    enum CodingKeys: String, CodingKey {

        case movies = "movies"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies)
    }

}
