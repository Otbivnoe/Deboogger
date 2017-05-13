//
//  ButtonPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 30/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public protocol ButtonPlugin: TextPlugin {
    
    func buttonPressed(_ sender: UIButton)
}

public extension ButtonPlugin {
    
    var nib: UINib {
        return UINib(nibName: String(describing: ButtonTableViewCell.self), bundle: nil)
    }
    
    var cellIdentifier: String {
        return String(describing: ButtonTableViewCell.self)
    }
    
    func configureCell(_ cell: UITableViewCell) {
        (cell as? ButtonTableViewCell)?.configure(by: self)
    }
}
