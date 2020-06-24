//
//  AppConstants.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

import Foundation

enum AppConstant {
    enum API {
        static let BaseUrl = ""
        enum Codes: Int {
            case success = 200
            case failed = 404
        }
    }
    
    enum Regex{
        static let Email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        static let Password = "^(?=.*[A-Z])[a-zA-Z\\d]{8,}$"
    }
    
}


struct Constant {
    static var genres = [String]()
}
