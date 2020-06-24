//
//  HomeTarget.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation
import Moya

typealias MoyaMethod = Moya.Method

enum HomeTarget {
    case getAllTrips
}

extension HomeTarget: TargetType {
    var baseURL: URL {
        return URL(string: AppConstant.API.BaseUrl)!
    }
    
    var path: String {
        switch self {
            
        case .getAllTrips:
            return HomeConstant.API.fetchJsonFromLocalFile.endPoint
            
        }
    }
    
    var method: MoyaMethod {
        switch self {
            
        case .getAllTrips:
            return .get
            
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getAllTrips:
            return  HomeConstant.API.fetchJsonFromLocalFile.SampleData.data(using: String.Encoding.utf8)!
            
        }
    }
    
    var task: Task {
        switch self {
        case .getAllTrips:
            return .requestPlain
        }
    }
    
    public var headers: [String: String]? {
        return [String: String]()
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

