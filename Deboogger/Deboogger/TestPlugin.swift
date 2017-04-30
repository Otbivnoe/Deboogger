//
//  TestPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

struct TestPlugin: SwitchPlugin {
    
    var title: String {
        return "Title"
    }
    
    var description: String? {
        return nil
    }
    
    var isOn: Bool {
        return true
    }
    
    func switchStateChanged(_ sender: UISwitch) {
        print("handle")
    }
}
