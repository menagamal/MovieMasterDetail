//
//  MoviesResponse.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
class MoviesResponse :NSObject, Codable, NSCoding {
    
    var movies : [Movie]?
    
    enum CodingKeys: String, CodingKey {
        
        case movies = "movies"
    }
    override init() {
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        movies = try values.decodeIfPresent([Movie].self, forKey: .movies)
        
        if let movies = movies {
            if !movies.isEmpty {
                for item in movies {
                    if let genres = item.genres {
                        Constant.genres.append(contentsOf: genres)
                    }
                }
            }
        }
    }
    
    
    //MARK: CACHE Initializers
    func encode(with coder: NSCoder) {
        coder.encode(self.movies, forKey: "movies")
    }
    
    required init?(coder: NSCoder) {
        super.init()
        self.movies = coder.decodeObject(forKey: "movies") as? [Movie]
        
    }
    
}

