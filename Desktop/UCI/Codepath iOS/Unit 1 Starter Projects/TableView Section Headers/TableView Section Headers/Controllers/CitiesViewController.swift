//
//  ViewController.swift
//  TableView Section Headers
//
//  Created by Memo on 1/11/19.
//  Copyright © 2019 Membriux. All rights reserved.
//

// –––––    Comment    –––––
// –––––    TODO:    –––––

import UIKit




class CitiesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // ––––– TODO: Connect TableView outlet
    
    @IBOutlet weak var cityTableView: UITableView!
    
    
    let data = [("Arizona", ["Phoenix"]),
                ("California", ["Los Angeles", "San Francisco", "San Jose", "San Diego"]),
                ("Florida", ["Miami", "Jacksonville"]),
                ("Illinois", ["Chicago"]),
                ("New York", ["Buffalo", "New York"]),
                ("Pennsylvania", ["Pittsburg", "Philadelphia"]),
                ("Texas", ["Houston", "San Antonio", "Dallas", "Austin", "Fort Worth"])]
    // Note: wouldn't have a data set like this in professional coding, it would appear more like classes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ––––– TODO: Assign tableView.datasource to VC
        cityTableView.dataSource = self // Self refers to view controller
        
        
        // ––––– TODO: Assign tableView.delegate to VC
        cityTableView.delegate = self // Self refers to view controller
        
        
        // ––––– TODO: Refresh tableView
        
    }
    
    

    // –––––  TODO: Add Table View Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Specifies the number of rows per section
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Modifies the information that each cell is going to have
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as! CityCell
        // TableView has cell that comes from class CityCell
        cell.cityLabel.text = data[indexPath.row].0
            // Set this as 0 because want first item, not the array
        
        // Project still not complete as of this area... look at completed
        //      Completed project looks to be compatible with search bar functionality, so it is modified for that case
        
        
        
        return cell
    }

}

