//
//  MovieMasterDetailTests.swift
//  MovieMasterDetailTests
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import XCTest
@testable import MovieMasterDetail

class MovieMasterDetailTests: XCTestCase {
    
    var homeInteractor:HomeInteractorMock!
    
    func testFetchJsonFromLocalFile() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let _ = bundle.url(forResource: "movies", withExtension: "json") else {
            XCTFail("Missing file: movies.json")
            return
        }
    }
    
    func testMoviesParsing() {
        homeInteractor = HomeInteractorMock()
        homeInteractor.parseMoviesFromLocalFile { (response) in
            if let error = response.0 as? HomeConstant.HomeError {
                XCTFail(error.localizedDescription)
            }
            if let movies = response.1 as? [Movie] {
                if movies.isEmpty {
                    XCTFail(HomeConstant.HomeError.ParsingError.localizedDescription)
                }
            }
        }
    }
    
    func testSearchWithTitle() {
        homeInteractor = HomeInteractorMock()
        homeInteractor.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            let comedyMovies = self.homeInteractor.searchWithGenres(str: "Comedy", items: movies)
            for item in comedyMovies {
                guard let geners = item.genres else {
                    XCTFail(HomeConstant.HomeError.SearchError.localizedDescription)
                    return
                }
                if !geners.contains("Comedy") {
                    XCTFail(HomeConstant.HomeError.SearchError.localizedDescription)
                }
            }
            
        }
    }
    
    func testSearchWithGenres() {
        homeInteractor = HomeInteractorMock()
        homeInteractor.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            let filteredMovies = self.homeInteractor.searchWithTitle(str: "Avengers", items: movies)
            if filteredMovies.isEmpty {
                XCTFail(HomeConstant.HomeError.NotFound.localizedDescription)
            }
        }
    }
    
}
