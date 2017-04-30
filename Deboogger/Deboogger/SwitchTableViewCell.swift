//
//  SwitchTableViewCell.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class SwitchTableViewCell: BaseTableViewCell {

    @IBOutlet weak var `switch`: UISwitch!
    
    private var plugin: SwitchPlugin?

    @IBAction func valueChanged(_ sender: UISwitch) {
        plugin?.handleSwitchEvent(isOn: sender.isOn)
    }

    func configure(by plugin: SwitchPlugin) {
        titleLabel.text = plugin.title
        descriptionLabel.text = plugin.description
        `switch`.isOn = plugin.isOn
    }
}
