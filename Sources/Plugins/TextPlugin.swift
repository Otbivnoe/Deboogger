//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

 public protocol TextPlugin: Plugin {
    
     var title: NSAttributedString { get }
     var description: NSAttributedString? { get }
}

public extension TextPlugin {
    
    private typealias Cell = DescriptionTableViewCell
    
    var description: NSAttributedString? {
        return nil
    }
    
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
