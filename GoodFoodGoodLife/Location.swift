//
//  Location.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 05/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import Foundation

struct Location {
    let coordinate: Coordinate?
    let distance: Double?
    let countryCode: String?
    let country: String?
    let state: String?
    let city: String?
    let streetAddress: String?
    let crossStreet: String?
    let postalCode: String?
    
    init?(json: [String : Any]) {
        if let latitude = json["lat"] as? Double, let longtitude = json["lng"] as? Double {
            coordinate = Coordinate(latitude: latitude, longtitude: longtitude)
        } else {
            coordinate = nil
        }
        
        distance = json["distance"] as? Double
        countryCode = json["cc"] as? String
        country = json["country"] as? String
        state = json["state"] as? String
        city = json["city"] as? String
        streetAddress = json["address"] as? String
        crossStreet = json["crossStreet"] as? String
        postalCode = json["postalCode"] as? String
        
    }
    
}
