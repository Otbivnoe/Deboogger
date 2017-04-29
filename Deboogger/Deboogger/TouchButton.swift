//
//  TouchButton.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 29/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

final class TouchButton: UIButton {
    
    private enum Layout {
        static let size: CGFloat = 50
    }
    
    init() {
        let size = Layout.size
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        
        layer.cornerRadius = size / 2
        layer.masksToBounds = false
        backgroundColor = .red
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        guard let superview = superview else {
            return
        }
        
        center = superview.center
        
        frame.origin.x = superview.bounds.width - Layout.size
        frame.origin.y = superview.bounds.height/2 - Layout.size/2
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        
    }
}

// MARK: - Touches

extension TouchButton {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
}
