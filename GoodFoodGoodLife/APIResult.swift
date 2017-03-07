//
//  APIResult.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 08/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import Foundation

enum APIResult <T> {
    case success(T)
    case failure(Error)
}
