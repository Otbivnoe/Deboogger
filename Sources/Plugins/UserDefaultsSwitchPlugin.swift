//
//  Copyright © 2018 Artem Novichkov. All rights reserved.
//

import Foundation

public final class UserDefaultsSwitchPlugin: SwitchPlugin {

    public var title: NSAttributedString
    public var description: NSAttributedString?
    public let key: String
    private let userDefaults: UserDefaults

    public init(title: NSAttributedString,
         description: NSAttributedString? = nil,
         key: String,
         userDefaults: UserDefaults = .standard) {
        self.title = title
        self.description = description
        self.key = key
        self.userDefaults = userDefaults
    }

    public var isOn: Bool {
        return userDefaults.bool(forKey: key)
    }

    public func switchStateChanged(_ sender: UISwitch) {
        userDefaults.set(sender.isOn, forKey: key)
    }
}
