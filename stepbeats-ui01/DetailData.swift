//
//  DetailData.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/5.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class DetailData: NSObject {
    //日期信息
    var mydate: String    //2018-9-5 18:02
    var myChart : UIImage
    //var myMap : UIImage
    var myType : String
    var myDistance: Float
    var myDuration: String
    var myPace: String
    var myHeartRate: Int
    var myBPM: Int
    
    init?(mydate: String, myChart: UIImage, myType: String,myDistance: Float, myDuration: String , myPace: String, myHeartRate: Int, myBPM: Int) {
        // Initialize stored properties.
        self.mydate = mydate
        self.myChart = myChart
        self.myType = myType
        self.myDistance = myDistance
        self.myDuration = myDuration
        self.myPace = myPace
        self.myHeartRate = myHeartRate
        self.myBPM = myBPM
    }
}
