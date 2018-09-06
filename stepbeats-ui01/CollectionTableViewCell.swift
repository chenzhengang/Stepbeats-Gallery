//
//  CollectionTableViewCell.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/4.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {

    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timesLabel: UILabel!
    @IBOutlet weak var tableShadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10
        tableShadowView.layer.masksToBounds = false//默认为false
        tableShadowView.layer.cornerRadius = 10
        tableShadowView.layer.shadowColor = UIColor.black.cgColor
        tableShadowView.layer.shadowOpacity = 0.5
        tableShadowView.layer.shadowOffset = CGSize(width:0, height: 3)
        tableShadowView.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
