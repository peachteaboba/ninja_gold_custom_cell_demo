//
//  MainViewController.swift
//  ninja_gold_custom_cell
//
//  Created by Andy Feng on 2/15/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddGoldDelegate {

    var buildingArray = [Building]()
    var gold = 0.0
    
    
    // Outlets -----
    @IBOutlet weak var goldLabel: UILabel!
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    // UI Lifecycle -----
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        buildingArray.append(Building(name: "House", image: UIImage(named: "house")!))
        buildingArray.append(Building(name: "Farm", image: UIImage(named: "farm")!))
        buildingArray.append(Building(name: "Cave", image: UIImage(named: "cave")!))
        buildingArray.append(Building(name: "Casino", image: UIImage(named: "casino")!))
        
        myTableView.reloadData()
        
        goldLabel.text = "Gold: \(gold)"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Table View Methods -----
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Instantiate the cell
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell") as! BuildingCell
        
        // Set some data
        cell.model = buildingArray[indexPath.row]
        cell.addGoldDelegate = self
        
        // Return the cell
        return cell

    }
    
    
    
    func addToTotalGold(num: Int, casino: Bool) {
        // Do stuff to the total amount
        print(num)
        print(casino)
        
        
        if casino {
            // the casino was clicked
            let add = round(gold * 0.1)
            if num == 1 {
                // add 10%
                gold += add
            } else {
                // minus 10%
                gold -= add
            }

        } else {
            // Not casino
            gold += Double(num)
        }
        
        
        goldLabel.text = "Gold: \(gold)"
        
        
        
    }


}













