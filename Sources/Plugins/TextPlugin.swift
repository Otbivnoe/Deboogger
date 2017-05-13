//
//  TextPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 30/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public protocol TextPlugin: Plugin {
    
    var title: String { get }
    var description: String? { get }
}

public extension TextPlugin {
    
    var description: String? {
        return nil
    }
    
    var nib: UINib {
        return UINib(nibName: String(describing: DescriptionTableViewCell.self), bundle: nil)
    }
    
    var cellIdentifier: String {
        return String(describing: DescriptionTableViewCell.self)
    }
    
    func configureCell(_ cell: UITableViewCell) {
        (cell as? DescriptionTableViewCell)?.configure(by: self)
    }
}
