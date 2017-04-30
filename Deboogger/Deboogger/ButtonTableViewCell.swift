//
//  ButtonTableViewCell.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 30/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class ButtonTableViewCell: BaseTextTableViewCell {

    private var plugin: ButtonPlugin?
    
    func configure(by plugin: ButtonPlugin) {
        super.configure(by: plugin)
        self.plugin = plugin
    }
}
