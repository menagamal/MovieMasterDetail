//
//  Array.swift
//  MovieMasterDetail
//
//  Created by Mena Gamal on 6/24/20.
//  Copyright © 2020 Mena Gamal. All rights reserved.
//

import Foundation

extension Array where Element : Hashable {
    var unique: [Element] {
        return Array(Set(self))
    }
}
extension Array where Element : Equatable {
    var unique: [Element] {
        var uniqueValues: [Element] = []
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}
