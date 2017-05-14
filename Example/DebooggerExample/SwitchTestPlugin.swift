//
//  SwitchTestPlugin.swift
//  DebooggerExample
//
//  Created by Nikita Ermolenko on 14/05/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import Deboogger

struct SwitchTestPlugin: SwitchPlugin {
    
    var title: String {
        return "Title"
    }
    
    var description: String? {
        return "Description"
    }
    
    var isOn: Bool {
        return true
    }
    
    func switchStateChanged(_ sender: UISwitch) {
        
    }
}
