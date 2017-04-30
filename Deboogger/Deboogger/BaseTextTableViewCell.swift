//
//  BaseTextTableViewCell.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 30/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

class BaseTextTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.configureLikeTitle()
        descriptionLabel.configureLikeDescription()
    }
    
    func configure(by plugin: TextPlugin) {
        titleLabel.text = plugin.title
        descriptionLabel.text = plugin.description
    }
}
