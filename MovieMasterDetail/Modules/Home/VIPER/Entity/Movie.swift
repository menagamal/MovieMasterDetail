//
//  Movie.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
struct Movie : Codable {
    let title : String?
    let year : Int?
    let cast : [String]?
    let genres : [String]?
    let rating : Int?

    init() {
        title = ""
        year = 0
        cast = [String]()
        genres = [String]()
        rating = 0
    }
    enum CodingKeys: String, CodingKey {

        case title = "title"
        case year = "year"
        case cast = "cast"
        case genres = "genres"
        case rating = "rating"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        cast = try values.decodeIfPresent([String].self, forKey: .cast)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
    }

}
