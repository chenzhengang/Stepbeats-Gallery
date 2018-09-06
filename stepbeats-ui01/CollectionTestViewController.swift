//
//  CollectionTestViewController.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/5.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class CollectionTestViewController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int)->Int{
        return 15
    }
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell

        cell.label.text = "222222"
        return cell
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
