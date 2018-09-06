//
//  Data.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/4.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class Data: NSObject {
    //MARK: Properties
    var year: Int
    var month: String
    var distance: Double
    var time: Int
    
    init?(year: Int, month: String , distance: Double, time: Int) {
        // Initialize stored properties.
        self.year = year
        self.month = month
        self.distance = distance
        self.time = time
    }
}
