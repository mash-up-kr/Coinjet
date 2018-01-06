//
//  MarketSettingViews.swift
//  Coinjet
//
//  Created by snow on 2018. 1. 6..
//  Copyright © 2018년 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class MarketSettingCell: UITableViewCell {
    
    @IBOutlet weak var checkMarkImageView: UIImageView!
    @IBOutlet weak var exchangeNameLabel: UILabel!
    
    var viewData: MarketSettingViewData? {
        didSet {
            guard let viewData = viewData else {
                return
            }
            exchangeNameLabel.text = viewData.exchangeName
            checkMarkImageView.isHidden = !viewData.isSelected
        }
    }
    
    
}
