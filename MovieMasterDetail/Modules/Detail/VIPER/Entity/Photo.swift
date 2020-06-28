//
//  Photo.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/26/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation
class Photo : NSObject, Codable, NSCoding {
    let id : String?
    let owner : String?
    let secret : String?
    let server : String?
    let farm : Int?
    let title : String?
    let ispublic : Int?
    let isfriend : Int?
    let isfamily : Int?
    
    var url:NSURL?
    var base64:String = ""

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case owner = "owner"
        case secret = "secret"
        case server = "server"
        case farm = "farm"
        case title = "title"
        case ispublic = "ispublic"
        case isfriend = "isfriend"
        case isfamily = "isfamily"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        owner = try values.decodeIfPresent(String.self, forKey: .owner)
        secret = try values.decodeIfPresent(String.self, forKey: .secret)
        server = try values.decodeIfPresent(String.self, forKey: .server)
        farm = try values.decodeIfPresent(Int.self, forKey: .farm)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        ispublic = try values.decodeIfPresent(Int.self, forKey: .ispublic)
        isfriend = try values.decodeIfPresent(Int.self, forKey: .isfriend)
        isfamily = try values.decodeIfPresent(Int.self, forKey: .isfamily)
    }
    //MARK: CACHE Initializers
    
    public required init?(coder aDecoder: NSCoder) {
       
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.owner = aDecoder.decodeObject(forKey: "owner") as? String
        self.secret = aDecoder.decodeObject(forKey: "secret") as? String
        self.server = aDecoder.decodeObject(forKey: "server") as? String
        self.farm = aDecoder.decodeObject(forKey: "farm") as? Int
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.ispublic = aDecoder.decodeObject(forKey: "ispublic") as? Int
        self.isfriend = aDecoder.decodeObject(forKey: "isfriend") as? Int
        self.isfamily = aDecoder.decodeObject(forKey: "isfamily") as? Int
        self.base64 = aDecoder.decodeObject(forKey: "base64") as? String ?? ""
    }
    
    open func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.owner, forKey: "owner")
        aCoder.encode(self.secret, forKey: "secret")
        aCoder.encode(self.server, forKey: "server")
        aCoder.encode(self.farm, forKey: "farm")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.ispublic, forKey: "ispublic")
        aCoder.encode(self.isfriend, forKey: "isfriend")
        aCoder.encode(self.isfamily, forKey: "isfamily")
        aCoder.encode(self.base64, forKey: "base64")
    }

}
