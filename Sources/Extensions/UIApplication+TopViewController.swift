//
//  UIApplication+TopViewController.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 06/05/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import UIKit

extension UIApplication {
    
    static var topViewController: UIViewController? {
        guard let window = UIApplication.shared.windows.first,
            let rootViewController = window.rootViewController else {
                return nil
        }
        return topViewController(for: rootViewController)
    }
    
    private static func topViewController(for viewController: UIViewController) -> UIViewController? {
        guard let presentedViewController = viewController.presentedViewController else {
            if let navigationController = viewController as? UINavigationController {
                if let lastViewController = lastViewController(from: navigationController) {
                    return topViewController(for: lastViewController)
                }
            }
            else if let alertController = viewController as? UIAlertController {
                return alertController.presentingViewController
            }
            return viewController
        }
        
        if let navigationController = viewController as? UINavigationController {
            if let lastViewController = lastViewController(from: navigationController) {
                return topViewController(for: lastViewController)
            }
            return viewController
        }
        else if let alertController = viewController as? UIAlertController {
            return alertController.presentingViewController
        }
        return topViewController(for: presentedViewController)
    }
    
    private static func lastViewController(from navigationController: UINavigationController) -> UIViewController? {
        return navigationController.viewControllers.last
    }
}
