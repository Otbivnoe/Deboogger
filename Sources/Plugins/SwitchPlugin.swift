//
//  SwitchPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public protocol SwitchPlugin: TextPlugin {

    var isOn: Bool { get }
    func switchStateChanged(_ sender: UISwitch)
}

public extension SwitchPlugin {

    var nib: UINib {
        return UINib(nibName: String(describing: SwitchTableViewCell.self), bundle: nil)
    }
    
    var cellIdentifier: String {
        return String(describing: SwitchTableViewCell.self)
    }
    
    func configureCell(_ cell: UITableViewCell) {
        (cell as? SwitchTableViewCell)?.configure(by: self)
    }
}
