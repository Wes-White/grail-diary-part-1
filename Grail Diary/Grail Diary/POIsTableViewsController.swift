//
//  ViewController.swift
//  Grail Diary
//
//  Created by Wesley Ryan on 3/17/20.
//  Copyright © 2020 Wesley Ryan. All rights reserved.
//

import UIKit

class POIsTableViewsController: UIViewController {
    @IBOutlet weak var poiTableView: UITableView!
    
    var pois: [POI] = [POI(location: "Hawaii", country: "USA", clues: ["clue 1" , "clue 2 ", "clue 3"])]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        poiTableView.dataSource = self //render my view
    }

    
    

}

extension POIsTableViewsController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count //return enough rows for all items in our array
    }
    
    //What should go into our cell??
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Need to unwrapp our custom cell
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell
            //if value is nil please tell us.
        else {
            fatalError("Cell is not a POITableViewCell ooopsiessss")
        }
        
        let poi = pois[indexPath.row]
        cell.countryLabel?.text = poi.country
        cell.locationLabel?.text = poi.location
        cell.cluesLabel?.text = "\(poi.clues.count) clues"
        return cell
    }
    
    
}
