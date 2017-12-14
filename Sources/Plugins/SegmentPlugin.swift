//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

 public protocol SegmentPlugin: TextPlugin {
    
     var items: [String] { get }
     var initialSelectedIndex: Int { get }
    
     func segmentValueChanged(_ sender: UISegmentedControl)
}

public extension SegmentPlugin {
    
    private typealias Cell = SegmentTableViewCell
    
    var nib: UINib {
        return UINib(nibName: String(describing: Cell.self), bundle: Bundle(for: Deboogger.self))
    }
    
    var cellIdentifier: String {
        return String(describing: Cell.self)
    }
    
    func configure(_ cell: UITableViewCell) {
        (cell as? Cell)?.configure(by: self)
    }
}
