//
//  TodayViewController.swift
//  Coin Widget
//
//  Created by Daeyun Ethan Kim on 02/01/2018.
//  Copyright © 2018 Daeyun Ethan Kim. All rights reserved.
//

import UIKit
import NotificationCenter

// MARK: - TodayViewController
class TodayViewController: UIViewController, NCWidgetProviding {
    
    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var coinIconImageView: UIImageView!
    @IBOutlet weak var coinNameLabel: UILabel!
    @IBOutlet weak var todayDateLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Functions
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        completionHandler(NCUpdateResult.newData)
    }
}
