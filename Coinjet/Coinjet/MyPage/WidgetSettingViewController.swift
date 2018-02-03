//
//  WidgetSettingViewController.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 03/02/2018.
//  Copyright © 2018 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class WidgetSettingViewController: UIViewController {
    let coin = ["BTC", "ETH", "DASH", "LTC", "ETC", "XRP", "BCH"]
    let market = ["빗썸", "코인원", "코빗", "업비트", "플로닉스"]
    var selectedCoinIndex = -1
    var selectedMarketIndex = -1
    
    @IBOutlet weak var widgetSettingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initNib()
        initUserDefault()
    }
    
    func initNib() {
        let nib = UINib(nibName: "WidgetSettingTableViewHeaderView", bundle: nil)
        widgetSettingTableView.register(nib, forHeaderFooterViewReuseIdentifier: "WidgetSettingTableViewHeaderView")
    }
    
    func initUserDefault() {
        if let selectedCoinIndex = UserDefaults.standard.object(forKey: "UserSelectedCoin") as? Int {
            self.selectedCoinIndex = selectedCoinIndex
        }
        if let selectedMarketIndex = UserDefaults.standard.object(forKey: "UserSelectedMarket") as? Int {
            self.selectedMarketIndex = selectedMarketIndex
        }
    }
}

extension WidgetSettingViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        var sectionTitle = ""
        if section == 0 {
            sectionTitle = "코인 선택"
        }
        else if section == 1 {
            sectionTitle = "거래소 선택"
        }
        
        guard let headerView = Bundle.main.loadNibNamed("WidgetSettingTableViewHeaderView", owner: self, options: nil)?.first as? WidgetSettingTableViewHeaderView else {
            return nil
        }
        headerView.configureView(sectionTitle)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }
        else if section == 1 {
            return 5
        }
        return 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WidgetSettingTableViewCell", for: indexPath) as? WidgetSettingTableViewCell else {
            return UITableViewCell()
        }
        var title = ""
        if indexPath.section == 0 {
            title = coin[indexPath.row]
            if selectedCoinIndex == indexPath.row {
                cell.checkMarkImageView.image = #imageLiteral(resourceName: "check")
            }
        }
        else if indexPath.section == 1 {
            title = market[indexPath.row]
            if selectedMarketIndex == indexPath.row {
                cell.checkMarkImageView.image = #imageLiteral(resourceName: "check")
            }
        }
        cell.configureCell(title)
     
        return cell
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WidgetSettingTableViewCell else {
            return
        }
        
        var section = -1
        var row = -1
        if indexPath.section == 0 {
            if selectedCoinIndex != -1 {
                section = 0
                row = selectedCoinIndex
            }
            selectedCoinIndex = indexPath.row
            UserDefaults.standard.set(selectedCoinIndex, forKey: "UserSelectedCoin")
        }
        else if indexPath.section == 1 {
            if selectedMarketIndex != -1 {
                section = 1
                row = selectedMarketIndex
            }
            selectedMarketIndex = indexPath.row
            UserDefaults.standard.set(selectedMarketIndex, forKey: "UserSelectedMarket")
        }
        
        if let cell = tableView.cellForRow(at: IndexPath(row: row, section: section)) as? WidgetSettingTableViewCell {
            cell.checkMarkImageView.image = nil
        }
        
        cell.checkMarkImageView.image = #imageLiteral(resourceName: "check")
        
        widgetSettingTableView.reloadData()
    }
}

class WidgetSettingTableViewHeaderView: UIView {
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureView(_ sectionTitle: String) {
        sectionTitleLabel.text = sectionTitle
    }
}

class WidgetSettingTableViewCell: UITableViewCell {
    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(_ title: String) {
        titleLabel.text = title
    }
}
