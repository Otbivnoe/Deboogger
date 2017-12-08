//
//  SliderTestPlugin.swift
//  DebooggerExample
//
//  Created by Nikita Ermolenko on 08/12/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import Deboogger

final class SliderTestPlugin: SliderPlugin {

    var initialValue: Float {
        return 50.0
    }

    var minValue: Float {
        return 10.0
    }

    var maxValue: Float {
        return 105.0
    }

    var title: NSAttributedString {
        return NSAttributedString(string: "Title")
    }

    var description: NSAttributedString? {
        return NSAttributedString(string: "Description Description Description Description Description Description Description Description")
    }

    func sliderValueChanged(_ slider: UISlider) {
        print(currentValue)
    }
}

