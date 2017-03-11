//
//  VenuesTableViewController.swift
//  GoodFoodGoodLife
//
//  Created by Harry Ng on 12/03/2017.
//  Copyright © 2017 DevConcept. All rights reserved.
//

import UIKit

class VenuesTableViewController : UITableViewController {
    
    var venues: [Venue] = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    var coordinate: Coordinate!
    var clientID: String = "Q4RAXDBRXZQHAG4ENIWYI4JVQXGQZB3MZ34P4CT4QHJYL2G4"
    var clientSecret: String = "IFMKHL4WGV013LQQWI4TXYFVH52GRQFBFJVUU1X1G2STGO4R"
    var foursquareClient: FoursquareClient!
    
    struct Storyboard {
        static let venueCell = "VenueCell"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foursquareClient = FoursquareClient(clientID: clientID, clientSecret: clientSecret)
        coordinate = Coordinate(latitude: 40.7, longtitude: -74)
        fetchVenues()
    }
    
    func fetchVenues() {
        if let coordinate = coordinate {
            foursquareClient.fetchVenuesFor(coordinate: coordinate, completion: { (result) in
                switch result {
                case .success(let venues):
                    self.venues = venues
                    print(self.venues)
                case .failure(let error):
                    let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            })
        }
        
    }
}

extension VenuesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return venues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.venueCell, for: indexPath)
        let venue = venues[indexPath.row]
        
        cell.textLabel?.text = venue.name
        
        return cell
    }
    
}
