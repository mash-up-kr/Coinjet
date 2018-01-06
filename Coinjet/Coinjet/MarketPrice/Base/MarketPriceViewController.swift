//
//  MarketPriceViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 27/11/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class MarketPriceViewController: UITableViewController, IndicatorInfoProvider {
    
    var indicatorInfo = IndicatorInfo(title: "")
    var viewData = [MarketPriceCellData(image: #imageLiteral(resourceName: "krw"), title: "실시간 시세(KRW)", value: "13,055,000", unit: "KRW"),
                    MarketPriceCellData(image: #imageLiteral(resourceName: "usd"), title: "실시간 시세(USD)", value: "12,040.99", unit: "USD"),
                    MarketPriceCellData(image: #imageLiteral(resourceName: "time"), title: "24시간 변동률", value: "▲1,420,000", unit: "+12.21%"),
                    MarketPriceCellData(image: #imageLiteral(resourceName: "primium"), title: "한국 프리미엄(KRW)", value: "+956,906", unit: "+7.92%"),
                    MarketPriceCellData(image: #imageLiteral(resourceName: "volume"), title: "거래량", value: "58,151", unit: "BTC")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketPriceCell", for: indexPath) as! MarketPriceCell
        cell.viewData = viewData[indexPath.row]
        return cell
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return indicatorInfo
    }
    
}
