//
//  Deboogger.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 06/05/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class Deboogger {
    
    static func configure(with plugins: [Plugin]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            let button = TouchButton(tapHandler: {
                let navigationController = UINavigationController(rootViewController: PluginViewController(plugins: plugins))
                navigationController.present()
            })
            
            UIApplication.shared.keyWindow?.addSubview(button)
        }
    }
}
