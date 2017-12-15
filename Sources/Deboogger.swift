//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public final class Deboogger {
    
    private static weak var pluginViewController: PluginViewController?
    
    public static func configure(with plugins: [Plugin]) {
        configure(with: PluginsConfiguration(plugins: plugins))
    }

    public static func configure(with sections: [Section]) {
        configure(with: SectionsConfiguration(sections: sections))
    }

    public static func reload() {
        pluginViewController?.tableView.reloadData()
    }
    
    public static func close() {
        pluginViewController?.dismiss(animated: true, completion: nil)
    }

    // MARK: - Helpers

    private static func configure(with configuration: Configuration) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let button = AssistiveButton(tapHandler: {
                let pluginViewController = PluginViewController(configuration: configuration)
                let navigationController = UINavigationController(rootViewController: pluginViewController)
                Deboogger.pluginViewController = pluginViewController
                navigationController.present()
            })

            UIApplication.shared.keyWindow?.addSubview(button)
        }
    }
}
