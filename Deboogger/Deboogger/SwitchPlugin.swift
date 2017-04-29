//
//  SwitchPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

protocol SwitchPlugin: Plugin {
    
    var title: String { get }
    var description: String? { get }
    var isOn: Bool { get }
    
    func handleSwitchEvent(isOn: Bool)
}

extension SwitchPlugin {
    
    var description: String? {
        return nil
    }
    
    var nib: UINib {
        return UINib(nibName: String(describing: SwitchTableViewCell.self), bundle: nil)
    }
    
    func configureCell(_ cell: UITableViewCell) {
        print("Configure")
    }
}
