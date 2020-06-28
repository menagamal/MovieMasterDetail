//
//  CacheHandler.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/28/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
import DataCache

class CacheHandler {
    
    static let shared = CacheHandler()
    
    private init() {
        
    }
    
    public func SaveData(moviesObject:MoviesResponse)  {
        
        DataCache.instance.write(object: moviesObject, forKey: HomeConstant.Keys.CACHE_KEY)
        
    }
    
    public  func loadAllCachedData() -> MoviesResponse? {
        if let data = DataCache.instance.readData(forKey: HomeConstant.Keys.CACHE_KEY)  {
            if let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? MoviesResponse {
                if let _ = obj.movies {
                    return obj
                }
                return nil
            } else {
                return nil
            }
            
        } else {
            return nil
        }
    }
    
    
    public func updateMovie(with movie:Movie) {
        for (i,item) in Constant.movieResponse.movies!.enumerated() {
            if let id = item.id , id == movie.id! {
                Constant.movieResponse.movies![i] = item
            }
        }
    }
}
