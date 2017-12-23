//
//  ContentTableViewCell.swift
//  Coinjet
//
//  Created by Daeyun Ethan Kim on 23/12/2017.
//  Copyright © 2017 Daeyun Ethan Kim. All rights reserved.
//

import UIKit

// MARK: - ContentTableViewCell
class ContentTableViewCell: UITableViewCell {

    // MARK: Properties
    
    // MARK: Outlets
    @IBOutlet weak var widthConstraintFornewPostIconContainerView: NSLayoutConstraint!
    @IBOutlet weak var newPostIconImageView: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    // MARK: Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(isToday: Bool) {
        if !isToday {
            widthConstraintFornewPostIconContainerView.constant = 0.0
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
