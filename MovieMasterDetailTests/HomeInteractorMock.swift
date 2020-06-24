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
    
    
}

protocol HomeMockUseCase {
    func parseMoviesFromLocalFile(completation: @escaping ((ServicesResponse) -> Void))
   
}


