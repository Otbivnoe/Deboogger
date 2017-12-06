//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

@objc public protocol SwitchPlugin: TextPlugin {

    @objc var isOn: Bool { get }
    @objc func switchStateChanged(_ sender: UISwitch)
}

public extension SwitchPlugin {

    private typealias Cell = SwitchTableViewCell
    
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
