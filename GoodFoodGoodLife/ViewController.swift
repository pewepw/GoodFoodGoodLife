//
//  ViewController.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 05/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let baseURL = "https://api.foursquare.com/v2/"
        let path = "venues/search?ll=40.7,-74&client_id=Q4RAXDBRXZQHAG4ENIWYI4JVQXGQZB3MZ34P4CT4QHJYL2G4&client_secret=IFMKHL4WGV013LQQWI4TXYFVH52GRQFBFJVUU1X1G2STGO4R&v=20170305"
        let urlString = "\(baseURL)\(path)"
        let url = URL(string: urlString)
        let urlRequest = URLRequest(url: url!)
        
        let networkProcessing = NetworkProcessing(request: urlRequest)
        
        networkProcessing.downloadJSON { (json, httpResponse, erro) in
            if let dictionary = json {
                if let metaDict = dictionary["meta"] as? [String:Any] {
                    let requestID = metaDict["requestId"] as! String
                    print(requestID)
                }
                
            }
        }
        
       
    }

    

}

