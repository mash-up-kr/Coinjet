//
//  MarketSettingViewController.swift
//  Coinjet
//
//  Created by snow on 2018. 1. 6..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class MarketSettingViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewData = [ MarketSettingViewData(exchangeName: "빗썸", isSelected: true),
                     MarketSettingViewData(exchangeName: "코인원", isSelected: false),
                     MarketSettingViewData(exchangeName: "코빗", isSelected: false),
                     MarketSettingViewData(exchangeName: "업데트", isSelected: false),
                     MarketSettingViewData(exchangeName: "폴로닉스", isSelected: false),
                     MarketSettingViewData(exchangeName: "비트렉스", isSelected: false),
                     MarketSettingViewData(exchangeName: "파이넥스", isSelected: false) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension MarketSettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MarketSettingCell", for: indexPath) as! MarketSettingCell
        cell.viewData = viewData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        for (index, _) in viewData.enumerated() {
            self.viewData[index].isSelected = (index == indexPath.row)
        }
        tableView.reloadData()
    }
    
}
