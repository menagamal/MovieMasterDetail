//
//  HomeConstant.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//


import Foundation

enum HomeConstant {
    struct Keys {
     
    }
    
    enum API {
        enum fetchJsonFromLocalFile {
            static let endPoint = "trips/recent.json"
            static let SampleData =
            """
            {
            "trips": [
                {
                    "id": 608,
                    "status": "COMPLETED",
                    "request_date": "2019-08-16 10:49:25",
                    "pickup_lat": -1.3234923,
                    "pickup_lng": 36.8435638,
                    "pickup_location": "St James, Nairobi",
                    "dropoff_lat": -1.323413,
                    "dropoff_lng": 36.8434199,
                    "dropoff_location": "Nextgen Mall, Nairobi",
                    "pickup_date": "2019-08-16 10:50:32",
                    "dropoff_date": "2019-08-16 11:26:32",
                    "type": "Lady",
                    "driver_id": 13,
                    "driver_name": "Alize",
                    "driver_rating": 5,
                    "driver_pic": "https://hr.hava.bz/trips/p13.jpg",
                    "car_make": "Honda",
                    "car_model": "Civic",
                    "car_number": "KCR-100P",
                    "car_year": 2012,
                    "car_pic": "https://hr.hava.bz/trips/c13.jpg",
                    "duration": 36,
                    "duration_unit": "min",
                    "distance": 1.54,
                    "distance_unit": "km",
                    "cost": 253,
                    "cost_unit": "KES"
                },
                {
                    "id": 585,
                    "status": "COMPLETED",
                    "request_date": "2019-08-09 06:45:05",
                    "pickup_lat": -1.2952686,
                    "pickup_lng": 36.8866489,
                    "pickup_location": "Manyanja, Nairobi",
                    "dropoff_lat": -1.3234763,
                    "dropoff_lng": 36.843356,
                    "dropoff_location": "St James, Nairobi",
                    "pickup_date": "2019-08-09 06:45:38",
                    "dropoff_date": "2019-08-09 08:34:38",
                    "type": "Basic",
                    "driver_id": 9,
                    "driver_name": "Richard",
                    "driver_rating": 0,
                    "driver_pic": "https://hr.hava.bz/trips/p9.jpg",
                    "car_make": "Nissan",
                    "car_model": "March",
                    "car_number": "KCQ-6711",
                    "car_year": 2015,
                    "car_pic": "https://hr.hava.bz/trips/c9.jpg",
                    "duration": 109,
                    "duration_unit": "min",
                    "distance": 15.51,
                    "distance_unit": "km",
                    "cost": 894,
                    "cost_unit": "KES"
                } ] }
            """
        }
        
    }
    
    enum HomeError :Error {
        case InvalidURL
        case ParsingError
        case NoJsonFile
        var localizedDescription: String {
            switch self {
            case .ParsingError:
                return "the data could not be read in the correct format."
            case .InvalidURL:
                return "Invalid Url Request"
                case .NoJsonFile:
                return "No Json File Found"
            }
        }
    }
    
}
