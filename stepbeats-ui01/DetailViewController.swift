//
//  DetailViewController.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/4.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: - Properties 从上到下
    //标题
    @IBOutlet weak var timeLable: UILabel!
    //图片
    @IBOutlet weak var myChart: UIImageView!
    @IBOutlet weak var myRoute: UIImageView!
    //label
    @IBOutlet weak var myDistanceLabel: UILabel!
    @IBOutlet weak var averageDistanceLabel: UILabel!
    @IBOutlet weak var myDurationLabel: UILabel!
    @IBOutlet weak var averageDuration: UILabel!
    @IBOutlet weak var myPaceLabel: UILabel!
    @IBOutlet weak var averagePaceLabel: UILabel!
    @IBOutlet weak var myHeartRateLabel: UILabel!
    @IBOutlet weak var averageHeartRateLabel: UILabel!
    @IBOutlet weak var myBPMLabel: UILabel!
    @IBOutlet weak var averageBPMLabel: UILabel!
    //进度条
    @IBOutlet weak var DistanceWidth: NSLayoutConstraint!
    @IBOutlet weak var averageDistanceWidth: NSLayoutConstraint!
    @IBOutlet weak var durationWidth: NSLayoutConstraint!
    @IBOutlet weak var averageDurationWidth: NSLayoutConstraint!
    @IBOutlet weak var paceWidth: NSLayoutConstraint!
    @IBOutlet weak var averagePaceWidth: NSLayoutConstraint!
    @IBOutlet weak var heartRateWidth: NSLayoutConstraint!
    @IBOutlet weak var averageHeartRateWidth: NSLayoutConstraint!
    @IBOutlet weak var BPMWidth: NSLayoutConstraint!
    @IBOutlet weak var averageBPMWidth: NSLayoutConstraint!
    
    let screenheight = UIScreen.main.bounds.size.height
    let screenwidth = UIScreen.main.bounds.size.width
    var data:DetailData?
    var getTime = "Today 00:00"

    var data0 = DetailData(mydate: "2018-09-06 18:29", myChart: UIImage(named: "chart1")!, myType: "Electro", myDistance: 2.35, myDuration: "0:18:35" , myPace: "04'34''", myHeartRate: 110, myBPM: 160)!
    let averageData = DetailData(mydate: "2018-09-06 18:29", myChart: UIImage(named: "chart1")!, myType: "Electro", myDistance: 1.65, myDuration: "0:15:23" , myPace: "05'25''", myHeartRate: 122, myBPM: 150)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMyLabelData()
        setupAverageLabelData()
        setupRect()
    }
    
    //设置用户值
    func setupMyLabelData(){
        timeLable.text = getTime
        myChart.image = data0.myChart
        myDistanceLabel.text = String(data0.myDistance) + " km"
        myDurationLabel.text = data0.myDuration
        myPaceLabel.text = data0.myPace
        myHeartRateLabel.text = String(data0.myHeartRate)
        myBPMLabel.text = String(data0.myBPM)
        myDistanceLabel.text = String(data0.myDistance) + " km"
        myDurationLabel.text = data0.myDuration
        myPaceLabel.text = data0.myPace
        myHeartRateLabel.text = String(data0.myHeartRate)
        myBPMLabel.text = String(data0.myBPM)
    }
    
    //设置平均值
    func setupAverageLabelData(){
        averageDistanceLabel.text = String(averageData.myDistance) + " km Average"
        averageDuration.text = String(averageData.myDuration) + " Average"
        averagePaceLabel.text = String(averageData.myPace) + " Average"
        averageHeartRateLabel.text = String(averageData.myHeartRate) + " Average"
        averageBPMLabel.text = String(averageData.myBPM) + " Average"
    }
    
    //设置下方进度条
    func setupRect(){
        //1 Distance
        if(data0.myDistance > averageData.myDistance){
            DistanceWidth.constant = screenwidth/2 - 16
            averageDistanceWidth.constant = DistanceWidth.constant * CGFloat(averageData.myDistance) / CGFloat(data0.myDistance)
        } else{
            averageDistanceWidth.constant = screenwidth/2 - 16
            DistanceWidth.constant = averageDistanceWidth.constant * CGFloat(data0.myDistance) / CGFloat(averageData.myDistance)
        }
        //2 Duration
        //转换成秒
        var splitedArray0 = data0.myDuration.components(separatedBy: ":")
        var splitedArray1 = averageData.myDuration.components(separatedBy: ":")
        let time0 = Int(splitedArray0[0])! * 3600 + Int(splitedArray0[1])! * 60 + Int(splitedArray0[2])!
        let time1 = Int(splitedArray1[0])! * 3600 + Int(splitedArray1[1])! * 60 + Int(splitedArray1[2])!
        if(time0 > time1){
            durationWidth.constant = screenwidth/2 - 16
            averageDurationWidth.constant = durationWidth.constant * CGFloat(time1) / CGFloat(time0)
        } else{
            averageDurationWidth.constant = screenwidth/2 - 16
            durationWidth.constant = averageDurationWidth.constant * CGFloat(time0) / CGFloat(time1)
        }
        //3 Pace
        //转换成‘’
        splitedArray0 = data0.myPace.components(separatedBy: "'")
        splitedArray1 = averageData.myPace.components(separatedBy: "'")
        let splitedArray2 = splitedArray0[1].components(separatedBy: "''")
        let splitedArray3 = splitedArray0[1].components(separatedBy: "''")
        let pace0 = Int(splitedArray0[0])! * 60 + Int(splitedArray2[0])!
        let pace1 = Int(splitedArray1[0])! * 60 + Int(splitedArray3[0])!
        if(pace0 > pace1){
            paceWidth.constant = screenwidth/2 - 16
            averagePaceWidth.constant = paceWidth.constant * CGFloat(pace1) / CGFloat(pace0)
        } else{
            averagePaceWidth.constant = screenwidth/2 - 16
            paceWidth.constant = averagePaceWidth.constant * CGFloat(pace0) / CGFloat(pace1)
        }
        //4 Heart Rate
        if(data0.myHeartRate > averageData.myHeartRate){
            heartRateWidth.constant = screenwidth/2 - 16
            averageHeartRateWidth.constant = heartRateWidth.constant * CGFloat(averageData.myHeartRate) / CGFloat(data0.myHeartRate)
        } else{
            averageHeartRateWidth.constant = screenwidth/2 - 16
            heartRateWidth.constant = averageHeartRateWidth.constant * CGFloat(data0.myHeartRate) / CGFloat(averageData.myHeartRate)
        }
        //5 BPM
        if(data0.myBPM > averageData.myBPM){
            BPMWidth.constant = screenwidth/2 - 16
            averageBPMWidth.constant = BPMWidth.constant * CGFloat(averageData.myBPM) / CGFloat(data0.myBPM)
        } else{
            averageBPMWidth.constant = screenwidth/2 - 16
            BPMWidth.constant = averageBPMWidth.constant * CGFloat(data0.myBPM) / CGFloat(averageData.myBPM)
        }
    }
    
    //MAKR: Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
