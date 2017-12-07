//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

 public protocol ButtonPlugin: TextPlugin {
    
    func buttonPressed(_ sender: UIButton)
}

public extension ButtonPlugin {
    
    private typealias Cell = ButtonTableViewCell
    
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
