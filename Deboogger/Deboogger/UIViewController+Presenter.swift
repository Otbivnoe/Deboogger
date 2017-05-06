//
//  UIViewController+Presenter.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 06/05/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import Foundation
import UIKit
import ObjectiveC

fileprivate enum AssociationKeys {
    static var windowType: UInt8 = 0
    static var presenterType: UInt8 = 0
}

extension UIViewController {
    
    fileprivate var alertWindow: UIWindow? {
        get {
            return objc_getAssociatedObject(self, &AssociationKeys.windowType) as? UIWindow
        }
        set {
            objc_setAssociatedObject(self, &AssociationKeys.windowType, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    fileprivate var presenter: UIViewController? {
        get {
            return objc_getAssociatedObject(self, &AssociationKeys.presenterType) as? UIViewController
        }
        set {
            objc_setAssociatedObject(self, &AssociationKeys.presenterType, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIViewController {
    
    func present() {
        presenter = UIViewController()
        
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.windowLevel = UIWindowLevelNormal
        alertWindow?.rootViewController = presenter
        alertWindow?.makeKeyAndVisible()

        presenter?.present(self, animated: true, completion: nil)
    }
}
