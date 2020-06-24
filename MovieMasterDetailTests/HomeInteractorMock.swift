//
//  HomeInteractorMock.swift
//  MovieMasterDetailTests
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

@testable import MovieMasterDetail

typealias ServicesResponse = (Error?,[Movie])
class HomeInteractorMock: HomeMockUseCase {
    
    func parseMoviesFromLocalFile(completation: @escaping ((ServicesResponse) -> Void)) {
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "movies", withExtension: "json") else {
            completation((HomeConstant.HomeError.NoJsonFile,[Movie]()))
            return
        }
        do {
            let json = try Data(contentsOf: url)
            do {
                let responseModel: MoviesResponse = try JSONDecoder().decode(MoviesResponse.self, from: json)
                
                completation((nil,responseModel.movies!))
            } catch {
                completation((HomeConstant.HomeError.ParsingError,[Movie]()))
            }
        } catch {
            completation((HomeConstant.HomeError.ParsingError,[Movie]()))
        }
    }
    
    func searchWithGenres(str: String, items: [Movie]) -> [Movie] {
        
        // Check if the word is Geners because it is less count comparing it to the whole number of movies
        let filteredGeners : [String] = Constant.genres.filter({
            return $0.contains(str)
        })
        
        if filteredGeners.isEmpty {
            // NOT Geners
            return [Movie]()
        } else {
            let filteredMovies : [Movie] = items.filter({
                if $0.genres != nil {
                    return $0.genres!.contains(filteredGeners.first!)
                }
                return false
            })
            return filteredMovies
        }
        
    }
    func searchWithTitle(str: String, items: [Movie]) -> [Movie] {
    
        let filteredMovies : [Movie] = items.filter({
                return $0.title!.contains(str)
        })
        return filteredMovies
    }
    
    
    
}

protocol HomeMockUseCase {
    func parseMoviesFromLocalFile(completation: @escaping ((ServicesResponse) -> Void))
    func searchWithGenres(str:String,items:[Movie]) -> [Movie]
    func searchWithTitle(str:String,items:[Movie]) -> [Movie]
}


