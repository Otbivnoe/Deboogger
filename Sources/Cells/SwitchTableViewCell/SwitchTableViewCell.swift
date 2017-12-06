//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class SwitchTableViewCell: BaseTextTableViewCell {

    @IBOutlet private weak var `switch`: UISwitch!
    private var plugin: SwitchPlugin?

    @IBAction func valueChanged(_ sender: UISwitch) {
        plugin?.switchStateChanged(sender)
    }

    func configure(by plugin: SwitchPlugin) {
        super.configure(by: plugin)
        self.plugin = plugin
        self.switch.isOn = plugin.isOn
    }
}
