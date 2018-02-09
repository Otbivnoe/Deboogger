//
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

public let DebooggerWillShow: NSNotification.Name = .init(rawValue: "DebooggerWillShow")
public let DebooggerDidShow: NSNotification.Name = .init(rawValue: "DebooggerDidShow")
public let DebooggerWillHide: NSNotification.Name = .init(rawValue: "DebooggerWillHide")
public let DebooggerEndHide: NSNotification.Name = .init(rawValue: "DebooggerEndHide")

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
                let rootViewController = UIApplication.shared.keyWindow?.rootViewController

                let pluginViewController = PluginViewController(configuration: configuration)
                pluginViewController.willHideHandler = { [weak rootViewController] in
                    rootViewController?.beginAppearanceTransition(true, animated: true)
                    NotificationCenter.default.post(name: DebooggerWillHide, object: nil)
                }

                pluginViewController.didHideHandler = { [weak rootViewController] in
                    rootViewController?.endAppearanceTransition()
                    NotificationCenter.default.post(name: DebooggerEndHide, object: nil)
                }

                let navigationController = UINavigationController(rootViewController: pluginViewController)
                Deboogger.pluginViewController = pluginViewController

                rootViewController?.beginAppearanceTransition(false, animated: true)
                NotificationCenter.default.post(name: DebooggerWillShow, object: nil)

                navigationController.present { [weak rootViewController] in
                    rootViewController?.endAppearanceTransition()
                    NotificationCenter.default.post(name: DebooggerDidShow, object: nil)
                }
            })

            UIApplication.shared.keyWindow?.addSubview(button)
        }
    }
}
