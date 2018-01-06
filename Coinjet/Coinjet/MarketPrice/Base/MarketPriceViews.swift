//
//  MarketPriceViews.swift
//  Coinjet
//
//  Created by snow on 2017. 12. 16..
//  Copyright © 2017년 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

class MarketPriceCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    
    var viewData: MarketPriceCellData? {
        didSet {
            guard let viewData = viewData else {
                return
            }
            iconImageView.image = viewData.image
            titleLabel.text = viewData.title
            valueLabel.text = viewData.value
            unitLabel.text = viewData.unit
        }
    }
    
}
