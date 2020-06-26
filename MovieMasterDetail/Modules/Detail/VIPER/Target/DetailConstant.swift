//
//  DetailConstant.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum DetailConstant {
    struct Keys {
        // API keys incase it was a POST request.
        
    }
    
    
    enum API {
        enum getMoviePhotos {
            static let endPoint = "services/rest/?method=flickr.photos.search"
            static let SampleData =
            """
            {
            "photos": {
                "page": 1,
                "pages": 15,
                "perpage": 100,
                "total": "1497",
                "photo": [
                    {
                        "id": "48935069262",
                        "owner": "185079367@N05",
                        "secret": "f2883087f9",
                        "server": "65535",
                        "farm": 66,
                        "title": "The Graduate - Alternative Movie Poster",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0
                    },
                    {
                        "id": "48559768731",
                        "owner": "74216903@N00",
                        "secret": "985a78879b",
                        "server": "65535",
                        "farm": 66,
                        "title": "Bradbury",
                        "ispublic": 1,
                        "isfriend": 0,
                        "isfamily": 0
                    } ]
                }
            }
            """
        }
        
    }
    
    enum DetailError :Error {
        case InvalidURL
        case ParsingError
        var localizedDescription: String {
            switch self {
            case .ParsingError:
                return "the data could not be read in the correct format."
            case .InvalidURL:
                return "Invalid Url Request"
            }
        }
    }
    
}
