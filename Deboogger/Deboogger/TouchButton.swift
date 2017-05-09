//
//  TouchButton.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 29/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

typealias TapHandler = () -> Void


final class TouchButton: UIButton {
    
    fileprivate enum Layout {
        static let size: CGFloat = 50
    }
    
    fileprivate var isMoving = false
    fileprivate var beginPoint = CGPoint.zero
    fileprivate var timer: Timer?
    
    private var tapHandler: TapHandler
    
    deinit {
        stopTimer()
    }
    
    init(tapHandler: @escaping TapHandler) {
        self.tapHandler = tapHandler
        let size = Layout.size
        
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        
        layer.cornerRadius = size / 2
        layer.masksToBounds = false
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
        addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(orientationChanged),
                                               name: NSNotification.Name.UIDeviceOrientationDidChange,
                                               object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        frame.origin.x = superview!.bounds.width - Layout.size
        frame.origin.y = superview!.bounds.height/2 - Layout.size/2
        
        startTimer()
    }
    
    @objc private func orientationChanged() {
        removeOffset()
    }
    
    // MARK: - Timer
    
    fileprivate func startTimer() {
        timer?.invalidate()
        timer = nil
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(update), userInfo: nil, repeats: false)
    }
    
    @objc private func update() {
        UIView.animate(withDuration: 0.2) {
            self.alpha = 0.3
        }
    }
    
    fileprivate func stopTimer() {
         alpha = 1.0
        
        timer?.invalidate()
        timer = nil
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        if isMoving {
            return
        }
        stopTimer()
        startTimer()
        tapHandler()
    }
}

// MARK: - Touches

extension TouchButton {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else {
            return
        }
        
        stopTimer()
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
        
        isMoving = true
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        removeOffset()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        removeOffset()
    }
    
    fileprivate func removeOffset() {
        isMoving = false
        
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
        
        startTimer()
    }
}
