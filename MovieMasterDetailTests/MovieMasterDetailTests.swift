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
    
    var homeInteractorMock:HomeInteractorMock!
    var homeInteractor:HomeInteractor!  
    var detailMock:DetailInteractorMock!
    
    func testFetchJsonFromLocalFile() throws {
        let bundle = Bundle(for: type(of: self))
        
        guard let _ = bundle.url(forResource: "movies", withExtension: "json") else {
            XCTFail("Missing file: movies.json")
            return
        }
    }
    
    func testMoviesParsing() {
        homeInteractorMock = HomeInteractorMock()
        homeInteractorMock.parseMoviesFromLocalFile { (response) in
            if let error = response.0 as? HomeConstant.HomeError {
                XCTFail(error.localizedDescription)
            }
            let movies = response.1
            if movies.isEmpty {
                XCTFail(HomeConstant.HomeError.ParsingError.localizedDescription)
            }
            
        }
    }
    
    func testSearchWithTitle() {
        homeInteractor = HomeInteractor()
        homeInteractorMock = HomeInteractorMock()
        homeInteractorMock.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            let comedyMovies = self.homeInteractor.searchWithTitle(str: "Comedy", items: movies)
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
        homeInteractor = HomeInteractor()
        homeInteractorMock = HomeInteractorMock()
        homeInteractorMock.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            let filteredMovies = self.homeInteractor.searchWithGenres(str: "Action", items: movies)
            if filteredMovies.isEmpty {
                XCTFail(HomeConstant.HomeError.NotFound.localizedDescription)
            }
        }
    }
    
    func testSearchWithTopRated() {
        homeInteractor = HomeInteractor()
        homeInteractorMock = HomeInteractorMock()
        homeInteractorMock.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            
            var filteredMovies = self.homeInteractor.searchWithGenres(str: "Action", items: movies)
            filteredMovies = self.homeInteractor.sortByTopRated(movies: filteredMovies)
            for i in 0..<filteredMovies.count - 1 {
                if filteredMovies[i].rating! != filteredMovies[i+1].rating! {
                    XCTAssertGreaterThan(filteredMovies[i].rating!, filteredMovies[i+1].rating!)
                }
            }
            
        }
    }
    
    func testGetPhotosApiParsing() {
        detailMock = DetailInteractorMock()
        let photos = parsePhotosFromMock()
        XCTAssertEqual(photos.count, 2)
        
    }
    private func parsePhotosFromMock() -> [Photo] {
        var photos = [Photo]()
        homeInteractorMock = HomeInteractorMock()
        homeInteractorMock.parseMoviesFromLocalFile { (response) in
            let movies = response.1
            self.detailMock.loadObjectMock(movie: movies.first!) { (response) in
                if let error = response.0 {
                    XCTFail(error.localizedDescription)
                }
                photos = response.1
            }
        }
        return photos
    }
    
    func testValidUrlBuilder() {
        detailMock = DetailInteractorMock()
        let photos = parsePhotosFromMock()
        let urlStr = self.detailMock.photoUrlBuilder(photo: photos[1])
        
        
        let imageView = UIImageView()
        if let url = URL(string: urlStr) {
            imageView.sd_setImage(with: url) { (img, err, typ, ur) in
                XCTAssertNil(err)
            }
        } else {
            XCTFail()
        }
        
        
    }
    
    
    
}
