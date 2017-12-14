//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import Deboogger

final class SegmentTestPlugin: SegmentPlugin {

    var items: [String] {
        return ["1", "2", "3"]
    }

    var title: NSAttributedString {
        return NSAttributedString(string: "Title for segment plugin")
    }

    var description: NSAttributedString? {
        return NSAttributedString(string: "Description for segment plugin, Description for segment plugin, Description for segment plugin, Description for segment plugin")
    }

    var initialSelectedIndex: Int {
        return 0
    }

    func segmentValueChanged(_ sender: UISegmentedControl) {

    }
}
