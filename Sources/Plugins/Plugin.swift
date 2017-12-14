//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

 public protocol Plugin {
    
    var nib: UINib { get }
    var cellIdentifier: String { get }

    func configure(_ cell: UITableViewCell)
    func selectionAction()
}

public extension Plugin {
    func selectionAction() {}
}
