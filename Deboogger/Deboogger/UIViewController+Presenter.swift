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

fileprivate final class PresenterViewController: UIViewController {
    
    private let _prefersStatusBarHidden: Bool
    private let _preferredStatusBarStyle: UIStatusBarStyle
    
    init(prefersStatusBarHidden: Bool, preferredStatusBarStyle: UIStatusBarStyle) {
        _prefersStatusBarHidden = prefersStatusBarHidden
        _preferredStatusBarStyle = preferredStatusBarStyle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return _preferredStatusBarStyle
    }
    
    override var prefersStatusBarHidden: Bool {
        return _prefersStatusBarHidden
    }
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
    
    fileprivate var presenter: PresenterViewController? {
        get {
            return objc_getAssociatedObject(self, &AssociationKeys.presenterType) as? PresenterViewController
        }
        set {
            objc_setAssociatedObject(self, &AssociationKeys.presenterType, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

extension UIViewController {
    
    func present() {
        let topViewController = UIApplication.topViewController!
        let prefersStatusBarHidden = topViewController.prefersStatusBarHidden
        let preferredStatusBarStyle = topViewController.preferredStatusBarStyle
        
        presenter = PresenterViewController(prefersStatusBarHidden: prefersStatusBarHidden, preferredStatusBarStyle: preferredStatusBarStyle)
        
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow?.windowLevel = UIWindowLevelNormal
        alertWindow?.rootViewController = presenter
        alertWindow?.makeKeyAndVisible()

        presenter?.present(self, animated: true, completion: nil)
    }
}
