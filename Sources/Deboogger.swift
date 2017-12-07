//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public final class Deboogger {
    
    private static weak var pluginViewController: PluginViewController?
    
    public static func configure(with plugins: [Plugin]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let button = AssistiveButton(tapHandler: {
                let pluginViewController = PluginViewController(plugins: plugins)
                let navigationController = UINavigationController(rootViewController: pluginViewController)
                Deboogger.pluginViewController = pluginViewController
                navigationController.present()
            })
            
            UIApplication.shared.keyWindow?.addSubview(button)
        }
    }
    
    public static func reload() {
        pluginViewController?.tableView.reloadData()
    }
    
    public static func close() {
        pluginViewController?.dismiss(animated: true, completion: nil)
    }
}
