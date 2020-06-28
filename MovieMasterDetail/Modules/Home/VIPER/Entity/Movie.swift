//
//  Movie.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
class Movie : NSObject, Codable, NSCoding  {
    var id:Int?
    
    var title : String?
    var year : Int?
    var cast : [String]?
    var genres : [String]?
    var rating : Int?
    var photoResponse: PhotoResponse?
    var shouldShow = true
    
    override init() {
        super.init()
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
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        year = try values.decodeIfPresent(Int.self, forKey: .year)
        cast = try values.decodeIfPresent([String].self, forKey: .cast)
        genres = try values.decodeIfPresent([String].self, forKey: .genres)
        rating = try values.decodeIfPresent(Int.self, forKey: .rating)
    }
    
    //MARK: CACHE Initializers
    
    public required init?(coder aDecoder: NSCoder) {
       
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.year = aDecoder.decodeObject(forKey: "year") as? Int
        self.cast = aDecoder.decodeObject(forKey: "cast") as? [String]
        self.genres = aDecoder.decodeObject(forKey: "genres") as? [String]
        self.rating = aDecoder.decodeObject(forKey: "rating") as? Int
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.photoResponse = aDecoder.decodeObject(forKey: "photoResponse") as? PhotoResponse
        self.shouldShow = aDecoder.decodeBool(forKey: "shouldShow") 
        
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.year, forKey: "year")
        aCoder.encode(self.cast, forKey: "cast")
        aCoder.encode(self.rating, forKey: "rating")
        aCoder.encode(self.genres, forKey: "genres")
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.photoResponse, forKey: "photoResponse")
        aCoder.encode(self.shouldShow, forKey: "shouldShow")
        
    }
    
    
    
}
