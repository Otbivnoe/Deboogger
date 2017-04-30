//
//  UIView+SuperviewOffset.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 29/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

enum Offset {
    case top(UIView)
    case left(UIView)
    case bottom(UIView)
    case right(UIView)
    
    var value: CGFloat {
        switch self {
        case let .top(view):    return view.frame.origin.y
        case let .left(view):   return view.frame.origin.x
        case let .bottom(view): return view.superview!.bounds.height - (view.frame.origin.y + view.bounds.height)
        case let .right(view):  return view.superview!.bounds.width - (view.frame.origin.x + view.bounds.width)
        }
    }
    
    func remove() {
        switch self {
        case let .top(view):    view.frame.origin.y -= value
        case let .left(view):   view.frame.origin.x -= value
        case let .bottom(view): view.frame.origin.y += value
        case let .right(view):  view.frame.origin.x += value
        }
    }
}

extension UIView {
  
    private var topOffset: Offset {
        return .top(self)
    }
    
    private var leftOffset: Offset {
        return .left(self)
    }
    
    private var bottomOffset: Offset {
        return .bottom(self)
    }
    
    private var rightOffset: Offset {
        return .right(self)
    }
    
    private var offsets: [Offset] {
        return [topOffset, leftOffset, bottomOffset, rightOffset]
    }
    
    var negativeOffsets: [Offset] {
        return offsets.filter {
            $0.value < 0
        }
    }
    
    var smallestOffset: Offset {
        return offsets.min(by: { offset1, offset2 -> Bool in
            offset1.value < offset2.value
        })!
    }
}

