//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation

public final class Section {

    let title: String
    let plugins: [Plugin]

    public init(title: String, plugins: [Plugin]) {
        self.title = title
        self.plugins = plugins
    }

    public convenience init(title: String, plugins: Plugin...) {
        self.init(title: title, plugins: plugins)
    }
}
