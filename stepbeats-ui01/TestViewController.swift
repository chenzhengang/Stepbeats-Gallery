//
//  TestViewController.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/4.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    @IBOutlet weak var button3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view1.layer.masksToBounds = true//true false都可以
        view1.layer.cornerRadius = 10
        
        button1.layer.masksToBounds = false//必须为false 为了显示阴影
        button1.layer.cornerRadius = 10
        button1.layer.shadowColor = UIColor.black.cgColor
        button1.layer.shadowOpacity = 0.8
        button1.layer.shadowOffset = CGSize(width:0, height: 3)
        button1.layer.shadowRadius = 5
        
        button2.layer.masksToBounds = false//默认为false
        button2.layer.cornerRadius = 10
        
        image.layer.masksToBounds = false//图片不能被正常切割！图片还是完整显示
        image.layer.cornerRadius = 10
        
        image2.layer.masksToBounds = true//设置为true才有圆角
        image2.layer.cornerRadius = 10
        
        image3.layer.masksToBounds = false
        image3.layer.shadowColor = UIColor.black.cgColor
        image3.layer.shadowOpacity = 0.8
        image3.layer.shadowOffset = CGSize(width:0, height: 3)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
