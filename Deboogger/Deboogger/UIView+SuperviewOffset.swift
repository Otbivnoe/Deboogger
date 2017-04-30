//
//  UIView+SuperviewOffset.swift
//  Deboogger
//
//  Created by Nikita Ermolenko on 29/04/2017.
//  Copyright © 2017 Nikita Ermolenko. All rights reserved.
//

import UIKit

protocol Offset {
    var value: CGFloat { get }
    func remove()
}

class BaseOffset {
    let view: UIView
    init(view: UIView) {
        self.view = view
    }
}

final class TopOffset: BaseOffset, Offset {
    var value: CGFloat {
        return view.frame.origin.y
    }
    
    func remove() {
        view.frame.origin.y -= value
    }
}

final class LeftOffset: BaseOffset, Offset {
    var value: CGFloat {
        return view.frame.origin.x
    }
    
    func remove() {
        view.frame.origin.x -= value
    }
}

final class BottomOffset: BaseOffset, Offset {
    var value: CGFloat {
        return view.superview!.bounds.height - (view.frame.origin.y + view.bounds.height)
    }
    
    func remove() {
        view.frame.origin.y += value
    }
}

final class RightOffset: BaseOffset, Offset {
    var value: CGFloat {
        return view.superview!.bounds.width - (view.frame.origin.x + view.bounds.width)
    }
    
    func remove() {
        view.frame.origin.x += value
    }
}

extension UIView {
  
    private var topOffset: TopOffset {
        return TopOffset(view: self)
    }
    
    private var leftOffset: LeftOffset {
        return LeftOffset(view: self)
    }
    
    private var bottomOffset: BottomOffset {
        return BottomOffset(view: self)
    }
    
    private var rightOffset: RightOffset {
        return RightOffset(view: self)
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

