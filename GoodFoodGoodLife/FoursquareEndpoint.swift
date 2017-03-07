//
//  FoursquareEndpoint.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 07/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import Foundation


enum FoursquareEndpoint {
    case search(clientID: String, clientSecret: String, coordinate: Coordinate, query: String?, searchRadius: Int?)
    
    var baseURL: String {
        return "https://api.foursquare.com"
    }
    
    var path: String {
        switch self {
        case .search: return "/v2/venues/search"
        }
    }
    
    private struct ParameterKeys {
        static let clientID = "client_id"
        static let clientSecret = "client_secret"
        static let version = "v"
        static let category = "categoryId"
        static let location = "ll"
        static let query = "query"
        static let limit = "limit"
        static let searchRadius = "radius"
    }
    
    private struct DefaultValues {
        static let version = "20170307"
        static let limit = "50"
        static let searchRadius = "2000"
    }
    
    var parameters: [String:Any] {
        switch self {
        case .search(let clientID, let clientSecret, let coordinate, let query, let searchRadius):
            var parameters : [String:Any] = [
                ParameterKeys.clientID : clientID,
               ParameterKeys.clientSecret : clientSecret,
                ParameterKeys.version : DefaultValues.version,
                ParameterKeys.location : coordinate.description
            ]
            
            if let searchRadius = searchRadius {
                parameters[ParameterKeys.searchRadius] = searchRadius
            } else {
                parameters[ParameterKeys.searchRadius] = DefaultValues.searchRadius
            }
            
            if let query = query {
                parameters[ParameterKeys.query] = query
            }
            
            return parameters
            
        }
    }
    
    
    // taking care of encoding of URL
    
    var queryItems: [URLQueryItem] {
        var components = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryKeyValue = URLQueryItem(name: key, value: "\(value)")
            components.append(queryKeyValue)
        }
        
        return components
    }
    
    var request: URLRequest {
        var components = URLComponents(string: baseURL)
        components?.path = path
        components?.queryItems = queryItems
        
        let url = components?.url
        return URLRequest(url: url!)
    }
    
    
}








