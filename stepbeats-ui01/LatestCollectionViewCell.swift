//
//  LatestCollectionViewCell.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/5.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class LatestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var chart: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置左上和右上圆角 ios11+
        chart.layer.masksToBounds = true
        chart.layer.cornerRadius = 10
        chart.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner , CACornerMask.layerMaxXMinYCorner]
        shadowView.layer.masksToBounds = false//默认为false
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width:0, height: 3)
        shadowView.layer.shadowRadius = 3
    }
}
