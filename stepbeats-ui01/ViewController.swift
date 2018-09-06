//
//  ViewController.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/3.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UICollectionViewDataSource{
    
    // MARK: - Properties 从上到下
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var datas = [Data]()
    var latestData = [DetailData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        loadSampleDatas()
        loadSampleDetailDatas()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "DataTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CollectionTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        // Fetches the appropriate meal for the data source layout.
        let data = datas[indexPath.row]
        cell.monthLabel.text = data.month
        cell.yearLabel.text = String(data.year)
        cell.distanceLabel.text = String(data.distance) + " km"
        cell.timesLabel.text = String(data.time)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section: Int)->Int{
        return latestData.count
    }
    func collectionView(_ collectionView:UICollectionView, cellForItemAt indexPath: IndexPath)->UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! LatestCollectionViewCell
        let data = latestData[indexPath.row]
        cell.distanceLabel.text = String(data.myDistance) + " km"
        cell.typeLabel.text = data.myType
        cell.chart.image = data.myChart
        //处理时间 "2018-06-08-18:05"
        var splitedArray0 = data.mydate.components(separatedBy: "-")
        let year = Int(splitedArray0[0])!
        let month = Int(splitedArray0[1])!
        let day = Int(splitedArray0[2])!
        let time = splitedArray0[3]
        //获取当前时间
        let calendar = Calendar.current
        let date = Date()
        let dateComponents = calendar.dateComponents([.year,.month, .day, .hour,.minute,.second], from: date)
        //不同年份
        if(dateComponents.year! > year){
            cell.timeLabel.text = String(year) + " " + String(month) + "-" + String(day)
        }
        //本月前几天 显示day gao
        else if (dateComponents.month == month){
            if(dateComponents.day == day){
                cell.timeLabel.text = "Today " + time
            }
            else if(dateComponents.day == day + 1){
                cell.timeLabel.text = "Yesterday " + time
            }
            else{
                let dayinterval = dateComponents.day! - day
                cell.timeLabel.text = String(dayinterval) + " days ago"
            }
        }
        //前几个月（直接显示日期）
        else {
            cell.timeLabel.text = String(year) + " " + String(month) + "-" + String(day)
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            guard let DataDetailViewController = segue.destination as? DetailViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            guard let selectedDataCell = sender as? LatestCollectionViewCell else {
                fatalError("Unexpected sender: \(String(describing: sender))")
            }
            guard let indexPath = collectionView.indexPath(for: selectedDataCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            let selectedData = latestData[indexPath.row]
            //传递转换好的时间
            //不能这么传
            //DataDetailViewController.timeLable.text = selectedDataCell.timeLabel.text
            DataDetailViewController.getTime = selectedDataCell.timeLabel.text!
            //传递数据
            DataDetailViewController.data0 = selectedData
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }
    
    //MARK: Private Methods
    private func loadSampleDatas() {
        
        guard let data1 = Data(year: 2017, month: "September" , distance: 342 , time: 18) else {
            fatalError("Unable to instantiate data1")
        }
        
        guard let data2 = Data(year: 2017, month: "August" , distance: 200 , time: 13) else {
            fatalError("Unable to instantiate data2")
        }
        
        guard let data3 = Data(year: 2016, month: "September" , distance: 120 , time: 8) else {
            fatalError("Unable to instantiate data2")
        }
        guard let data4 = Data(year: 2016, month: "May" , distance: 255 , time: 18) else {
            fatalError("Unable to instantiate data1")
        }
        
        guard let data5 = Data(year: 2016, month: "January" , distance: 190 , time: 10) else {
            fatalError("Unable to instantiate data2")
        }
        
        guard let data6 = Data(year: 2015, month: "September" , distance: 400 , time: 25) else {
            fatalError("Unable to instantiate data2")
        }
        
        datas += [data1, data2, data3, data4, data5, data6]
    }
    
    private func loadSampleDetailDatas() {
        
        guard let data1 = DetailData(mydate: "2018-09-06-18:29", myChart: UIImage(named: "chart1")!, myType: "Electro", myDistance: 0.30, myDuration: "0:01:25" , myPace: "01'34''", myHeartRate: 95, myBPM: 100) else {
            fatalError("Unable to instantiate data1")
        }
        
        guard let data2 = DetailData(mydate: "2018-09-05-15:02", myChart: UIImage(named: "chart2")!, myType: "Piano", myDistance: 1.25, myDuration: "0:10:35" , myPace: "03'34''", myHeartRate: 110, myBPM: 130) else {
            fatalError("Unable to instantiate data2")
        }
        
        guard let data3 = DetailData(mydate: "2018-09-01-15:02", myChart: UIImage(named: "chart1")!, myType: "Electro", myDistance: 1.25, myDuration: "0:10:35" , myPace: "03'34''", myHeartRate: 110, myBPM: 130) else {
            fatalError("Unable to instantiate data3")
        }
        
        guard let data4 = DetailData(mydate: "2018-03-03-13:02", myChart: UIImage(named: "chart2")!, myType: "Piano", myDistance: 1.25, myDuration: "0:10:35" , myPace: "03'34''", myHeartRate: 110, myBPM: 130) else {
            fatalError("Unable to instantiate data2")
        }
        
        guard let data5 = DetailData(mydate: "2017-09-03-13:02", myChart: UIImage(named: "chart1")!, myType: "Piano", myDistance: 1.25, myDuration: "0:10:35" , myPace: "03'34''", myHeartRate: 110, myBPM: 130) else {
            fatalError("Unable to instantiate data2")
        }
        
        guard let data6 = DetailData(mydate: "2016-06-06-15:45", myChart: UIImage(named: "chart2")!, myType: "Electro", myDistance: 2.35, myDuration: "0:18:35" , myPace: "04'34''", myHeartRate: 120, myBPM: 160) else {
            fatalError("Unable to instantiate data2")
        }
        
        latestData += [data1, data2, data3, data4, data5 ,data6]
    }
    
}

