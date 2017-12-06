//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

@objc public protocol SegmentPlugin: TextPlugin {
    
    @objc var items: [String] { get }
    @objc var selectedIndex: Int { get }
    
    @objc func segmentValueChanged(_ sender: UISegmentedControl)
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
