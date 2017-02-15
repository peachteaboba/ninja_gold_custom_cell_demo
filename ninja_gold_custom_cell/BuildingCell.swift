//
//  BuildingCell.swift
//  ninja_gold_custom_cell
//
//  Created by Andy Feng on 2/15/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class BuildingCell: UITableViewCell {
    
    var addGoldDelegate: AddGoldDelegate?
    
   
    @IBOutlet weak var myImage: UIImageView!
    
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    
    @IBAction func handleGoButtonPressed(_ sender: UIButton) {
        _model?.count += 1
        countLabel.text = "click count: \((_model?.count)!)"
        
        var c = false

        var min = 0
        var max = 0
        
        if _model?.name == "House" {
            min = 1
            max = 6
        } else if _model?.name == "Farm" {
            min = 10
            max = 21
        } else if _model?.name == "Cave" {
            min = 25
            max = 51
        } else {
            min = 0
            max = 2
            c = true
        }
        
        addGoldDelegate?.addToTotalGold(num: Int(arc4random_uniform(UInt32(max - min))) + min, casino: c)
        
    }
    
    
    // Model -------------
    private var _model : Building?
    
    
    var model : Building {
        
        set {
            _model = newValue
            
            // Do stuff
            doStuff()
            
            
        }
        
        get {
            return _model!
        }

        
    }
    
    
    
    func doStuff(){
        myImage.image = _model?.image
        countLabel.text = "click count: \((_model?.count)!)"
        
        if _model?.name == "House" {
            amountLabel.text = "+1 ~ 5"
        } else if _model?.name == "Farm" {
            amountLabel.text = "+10 ~ 20"
        } else if _model?.name == "Cave" {
            amountLabel.text = "+25 ~ 50"
        } else {
            amountLabel.text = "+/- 10%"
        }
        
    }
    
    
    
    
    
}
