//
//  DetailTarget.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import Moya

typealias MoyaMethod = Moya.Method

enum DetailTarget {
    case getMoviePhotos(movei:Movie)
}

extension DetailTarget: TargetType {
    var baseURL: URL {
        return URL(string: AppConstant.API.BaseUrl)!
    }
    
    var path: String {
        switch self {
            
        case .getMoviePhotos:
            return DetailConstant.API.getMoviePhotos.endPoint
            
        }
    }
    
    var method: MoyaMethod {
        switch self {
            
        case .getMoviePhotos:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getMoviePhotos:
            return  DetailConstant.API.getMoviePhotos.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .getMoviePhotos(let movie):
            var params = [String : Any]()
            
            params[DetailConstant.Keys.apiKey] = DetailConstant.Values.APIKEY
            params[DetailConstant.Keys.method] = DetailConstant.Values.METHOD
            params[DetailConstant.Keys.format] = DetailConstant.Values.FORMAT
            params[DetailConstant.Keys.nojsoncallback] = DetailConstant.Values.JSONCALLBACK
            params[DetailConstant.Keys.text] = movie.title!
            if let genrs = movie.genres {
                params[DetailConstant.Keys.tags] = genrs.description
            }
            
            
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String: String]? {
        switch self {
        case .getMoviePhotos:
            return [String: String]()
        }
        
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

