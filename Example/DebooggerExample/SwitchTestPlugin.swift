//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import Deboogger

struct SwitchTestPlugin: SwitchPlugin {
    
    var title: NSAttributedString {
        return NSAttributedString(string: "Title")
    }
    
    var description: NSAttributedString? {
        return NSAttributedString(string: "Description")
    }
    
    var isOn: Bool {
        return true
    }
    
    func switchStateChanged(_ sender: UISwitch) {
        
    }
}
