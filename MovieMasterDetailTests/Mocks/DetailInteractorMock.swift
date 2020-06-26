//
//  DetailInteractorMock.swift
//  MovieMasterDetailTests
//
//  Created by Mena Gamal on 6/27/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

@testable import MovieMasterDetail

typealias PhotosCompetationResponse = (Error?,[Photo])

class DetailInteractorMock: DetailInteractorMockUseCases {
    
    
    func loadObjectMock(movie: Movie, completation: @escaping ((PhotosCompetationResponse) -> Void))  {
        let temp = DetailTarget.getMoviePhotos.sampleData
        do {
            let responseModel: PhotoApiResponse = try JSONDecoder().decode(PhotoApiResponse.self, from: temp)
            
            completation((nil,responseModel.photos!.photo!))
        } catch {
            completation((DetailConstant.DetailError.ParsingError,[Photo]()))
        }
    }
    func photoUrlBuilder(photo: Photo) -> String {
        let farm = Int(photo.farm!)
        let server = Int(photo.server!)!
        let id = Int(photo.id!)!
        let secret = photo.secret!
        let url = "https://farm​\(farm)​.static.flickr.com/\(server)​/\(id)​_​\(secret)​.jpg"
        if let encoded = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) {
            return encoded
        }
        
        return ""
    }
    
    
}
protocol DetailInteractorMockUseCases {
    func loadObjectMock(movie: Movie, completation: @escaping ((PhotosCompetationResponse) -> Void))
    func photoUrlBuilder(photo: Photo) -> String 
}
