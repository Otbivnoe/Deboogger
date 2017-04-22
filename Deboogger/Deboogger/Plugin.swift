//
//  Plugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

protocol Plugin {
    
    // TODO: remove identifier
    var nib: UINib { get }
    var cellIdentifier: String { get }
    
    func configureCell(_ cell: UITableViewCell)
}
