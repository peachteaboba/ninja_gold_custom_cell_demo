//
//  AddGoldDelegate.swift
//  ninja_gold_custom_cell
//
//  Created by Andy Feng on 2/15/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import Foundation

protocol AddGoldDelegate: class {
    func addToTotalGold(num: Int, casino: Bool)
}
