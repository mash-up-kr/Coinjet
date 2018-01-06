//
//  HomeViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 27/11/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var graphView: UIView!
    
    var numberOfDataItems = 29
    lazy var darkLinePlotData: [Double] = self.generateRandomData(self.numberOfDataItems, max: 50, shouldIncludeOutliers: true)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        gradient.colors = [
            UIColor(rgb: 0x9C6CE6).cgColor,
            UIColor(rgb: 0x469BD6).cgColor
        ]
        
        gradient.frame = headerView.bounds
        
        headerView.layer.insertSublayer(gradient, at: 0)
        
        let graphContentView = createDarkGraph(graphView.frame)
        graphView.addSubview(graphContentView)
        
        graphContentView.snp.makeConstraints { (make) in
            make.bottom.top.right.left.equalTo(graphView).offset(0)
        }
    }
    
}

extension HomeViewController: ScrollableGraphViewDataSource {
    
    func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        return darkLinePlotData[pointIndex]
    }
    
    func numberOfPoints() -> Int {
        return numberOfDataItems
    }
    
    fileprivate func createDarkGraph(_ frame: CGRect) -> ScrollableGraphView {
        let graphView = ScrollableGraphView(frame: frame, dataSource: self)
        
        // Setup the line plot.
        let linePlot = LinePlot(identifier: "darkLine")
        
        linePlot.lineWidth = 1
        linePlot.lineColor = UIColor(rgb: 0x777777)
        linePlot.lineStyle = ScrollableGraphViewLineStyle.smooth
        
        linePlot.shouldFill = true
        linePlot.fillType = ScrollableGraphViewFillType.solid
        linePlot.fillColor = UIColor(rgb: 0xffffff)
        
        linePlot.adaptAnimationType = ScrollableGraphViewAnimationType.elastic
        
        // Setup the graph
        graphView.backgroundFillColor = UIColor.init(white: 1.0, alpha: 0.0)
        graphView.dataPointSpacing = 80
        
        graphView.shouldAnimateOnStartup = true
        graphView.shouldAdaptRange = true
        graphView.shouldRangeAlwaysStartAtZero = true
        
        graphView.rangeMax = 50
        
        graphView.addPlot(plot: linePlot)
        
        return graphView
    }
    
    private func generateRandomData(_ numberOfItems: Int, max: Double, shouldIncludeOutliers: Bool = true) -> [Double] {
        var data = [Double]()
        for _ in 0 ..< numberOfItems {
            var randomNumber = Double(arc4random()).truncatingRemainder(dividingBy: max)
            
            if(shouldIncludeOutliers) {
                if(arc4random() % 100 < 10) {
                    randomNumber *= 3
                }
            }
            
            data.append(randomNumber)
        }
        return data
    }
    
    private func generateRandomData(_ numberOfItems: Int, variance: Double, from: Double) -> [Double] {
        
        var data = [Double]()
        for _ in 0 ..< numberOfItems {
            
            let randomVariance = Double(arc4random()).truncatingRemainder(dividingBy: variance)
            var randomNumber = from
            
            if(arc4random() % 100 < 50) {
                randomNumber += randomVariance
            }
            else {
                randomNumber -= randomVariance
            }
            
            data.append(randomNumber)
        }
        return data
    }
    
}
