//
//  LatestCollectionViewCell.swift
//  stepbeats-ui01
//
//  Created by Chun Kong on 2018/9/5.
//  Copyright © 2018年 chenzhengang. All rights reserved.
//

import UIKit
import Charts

class LatestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var lineChartView: LineChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //设置左上和右上圆角 ios11+
        chartView.layer.masksToBounds = true
        chartView.layer.cornerRadius = 10
        chartView.layer.maskedCorners = [CACornerMask.layerMinXMinYCorner , CACornerMask.layerMaxXMinYCorner]
        shadowView.layer.masksToBounds = false//默认为false
        shadowView.layer.cornerRadius = 10
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowOffset = CGSize(width:0, height: 3)
        shadowView.layer.shadowRadius = 3
        setupChart()
    }
    
    func setupChart(){
        lineChartView.dragEnabled = false
        lineChartView.setScaleEnabled(false)
        lineChartView.pinchZoomEnabled = false
        //绘制图形背景区域   但是只有内部矩形里面有  外面没有
        lineChartView.drawGridBackgroundEnabled = true
        //背景颜色
        //lineChartView.gridBackgroundColor = UIColor(red: 192/255, green: 132/255, blue: 226/255, alpha: 1)
        lineChartView.gridBackgroundColor = UIColor.clear
        //不知道为啥默认是有的
        lineChartView.chartDescription = nil
        let l = lineChartView.legend
        //左下角标识的字体
        l.font = UIFont(name: "HelveticaNeue-Light", size: 0)!
        l.textColor = UIColor.clear
        
        //不显示图例头部
        l.form = .none
        
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        lineChartView.legend.enabled = false
        lineChartView.noDataText = "没有可展示的数据"
        
        //创建一个空数组
        var days = Array(repeating: "", count: 8)
        for i in 0..<8 {
            //days[i] = String(3 * i) + "'"  + "''"
            days[i] = String(i)
        }
        days[0] = " "
        days[7] = " "
        let time = [135,148,143,160,150,159,146,150]
        setChart(dataPoints:days, values: time)
    }
    
    func setChart(dataPoints: [String], values: [Int]){
        lineChartView.noDataText = "no data"
        //x轴方向 默认上方
        lineChartView.xAxis.labelPosition = .bottom
        //自定义标签刻度
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        //x轴设置虚线
        //lineChartView.xAxis.gridLineDashLengths = [4,2]
        //刻度设置
        lineChartView.leftAxis.axisMinimum = 130 //最小刻度值
        //lineChartView.xAxis.axisMaximum = 15 //最大刻度值
        lineChartView.leftAxis.granularity = 10 //最小间隔
        //可以使数据在中间
        lineChartView.leftAxis.spaceTop = 0.4
        lineChartView.leftAxis.spaceBottom = 0.1
        
        //y轴无网格线 left right要一起设置 不然会还有
        lineChartView.leftAxis.drawGridLinesEnabled = false //不绘制网格线
        lineChartView.rightAxis.drawGridLinesEnabled = false //不绘制网格线
        //不绘制y轴右侧文字
        lineChartView.rightAxis.drawLabelsEnabled = false
        lineChartView.leftAxis.axisLineWidth = 2 //左Y轴宽度
        lineChartView.leftAxis.axisLineColor = .black//左Y轴颜色
        lineChartView.xAxis.axisLineWidth = 2 //x轴宽度
        lineChartView.xAxis.axisLineColor = .black //x轴颜色
        
        //lineChartView.Axis.enabled = false //禁用右侧的Y轴
        //chartView.rightAxis.drawLabelsEnabled = false //不绘制右侧Y轴文字
        //chartView.rightAxis.drawAxisLineEnabled = false //不显示右侧Y轴
        
        
        var dataEntries: [ChartDataEntry] = []
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: Double(i), y:Double(values[i]) )
            dataEntries.append(dataEntry)
        }
        let chartDataSet = LineChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = LineChartData(dataSet: chartDataSet)
        //线条颜色
        chartDataSet.colors = [.black]
        //线条大小
        chartDataSet.lineWidth = 2
        chartDataSet.drawCirclesEnabled = false //不绘制转折点
        //折点颜色大小  要去掉的话  最好设置颜色为透明，如果设置不绘制转折点或者半径为0 数据会和线重叠
        //chartDataSet.circleRadius = 3
        chartDataSet.circleHoleColor = .clear
        chartDataSet.circleColors = [.clear]
        
        //不开启十字线
        chartDataSet.highlightEnabled = false
        //曲线平滑显示
        chartDataSet.mode = .cubicBezier
        //文字颜色
        chartDataSet.valueColors = [UIColor(red: 0, green: 0, blue: 0, alpha: 0.6)]
        //文字大小
        chartDataSet.valueFont = .systemFont(ofSize: 10)
        //开启填充色绘制
        chartDataSet.drawFilledEnabled = true
        //渐变颜色数组
        let gradientColors = [UIColor.black.cgColor, UIColor.white.cgColor] as CFArray
        //每组颜色所在位置（范围0~1)
        let colorLocations:[CGFloat] = [1.0, 0.0]
        //生成渐变色
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                       colors: gradientColors, locations: colorLocations)
        //将渐变色作为填充对象s
        chartDataSet.fill = Fill.fillWithLinearGradient(gradient!, angle: 90.0)
        // 加上一个界限, 演示图中红色的线
        //let jx = ChartLimitLine(limit: 12.0, label: "LimitLine")
        //lineChartView.rightAxis.addLimitLine(jx)
        lineChartView.data = chartData
        //要放在最后
        //设置最大显示数据
        lineChartView.setVisibleXRangeMaximum(7)
        //y轴方向动画
        lineChartView.animate(yAxisDuration: 1.0, easingOption: .easeInBounce)
    }
    
}
