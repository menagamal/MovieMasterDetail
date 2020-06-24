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
    
    
}
