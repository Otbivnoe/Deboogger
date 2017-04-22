//
//  TestPlugin.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 22/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation

struct TestPlugin: SwitchPlugin {
    
    var title: String {
        return "Title"
    }
    
    var isOn: Bool {
        return true
    }
    
    func handleSwitchEvent(isOn: Bool) {
        print("handle")
    }
}
