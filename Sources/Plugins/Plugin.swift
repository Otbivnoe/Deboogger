//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

@objc public protocol Plugin {
    
    @objc var nib: UINib { get }
    @objc var cellIdentifier: String { get }
    
    @objc func configure(_ cell: UITableViewCell)
}
