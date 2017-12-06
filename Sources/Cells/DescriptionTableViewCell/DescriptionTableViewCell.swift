//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class DescriptionTableViewCell: BaseTextTableViewCell {

    private var plugin: TextPlugin?
    
    override func configure(by plugin: TextPlugin) {
        super.configure(by: plugin)
        self.plugin = plugin
    }
}
