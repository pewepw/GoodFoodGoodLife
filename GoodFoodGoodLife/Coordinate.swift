//
//  Coordinate.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 05/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import Foundation

struct Coordinate : CustomStringConvertible {
    let latitude: Double
    let longtitude: Double
    
    var description: String {
        return "\(latitude),\(longtitude)"
    }
}

