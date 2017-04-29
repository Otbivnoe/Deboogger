//
//  TouchButton.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 29/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

// TODO: Animate alpha

final class TouchButton: UIButton {
    
    fileprivate enum Layout {
        static let size: CGFloat = 50
    }
    
    fileprivate var beginPoint = CGPoint.zero
    
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
        
        guard let touch = touches.first else {
            return
        }
        
        beginPoint = touch.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else {
            return
        }
        
        let currentPosition = touch.location(in: self)
        let offsetX = currentPosition.x - beginPoint.x
        let offsetY = currentPosition.y - beginPoint.y
        
        center.x += offsetX
        center.y += offsetY
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.beginAnimations("move", context: nil)
        UIView.setAnimationDuration(0.2)
        
        if negativeOffsets.isEmpty {
            smallestOffset.remove()
        }
        else {
            negativeOffsets.forEach { offset in
                offset.remove()
            }
        }
        
        UIView.commitAnimations()
    }
}
