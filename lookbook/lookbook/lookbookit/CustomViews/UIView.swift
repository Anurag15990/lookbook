//
//  UIView.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var cornerRadius: CGFloat {
        set { layer.cornerRadius = newValue }
        get { return layer.cornerRadius }
    }
    
    public var borderColor: CGColor {
        set { layer.borderColor = newValue }
        get { return layer.borderColor }
    }
    
    public var borderWidth: CGFloat {
        set { layer.borderWidth = newValue }
        get { return layer.borderWidth }
    }
    
    public func setBorderWithColor(color: CGColor, width: CGFloat = 1, cornerRadius: CGFloat = 0) {
        self.borderColor = color
        self.borderWidth = width
        self.cornerRadius = cornerRadius
    }
    
    public func addBorderShadow() {
        layer.shadowColor = UIColorMake(150, 150, 150, alpha: 1.0).CGColor
        layer.shadowOffset = CGSizeMake(0, 0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 1.0
        layer.rasterizationScale = UIScreen.mainScreen().scale
        layer.shouldRasterize = true
    }
    
    class var interViewSpacing: CGFloat {
        get { return 5 }
    }
    
    public class func instanceWithAutoLayout() -> Self {
        var v = self()
        v.setTranslatesAutoresizingMaskIntoConstraints(false)
        return v
    }
    
    func addSingleTapGestureRecognizer(#target: AnyObject, action: Selector) {
        userInteractionEnabled = true
        addGestureRecognizer(CreateSingleTapGestureRecognizer(target, action))
    }
    
    func updateViewLayout() {
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        layoutIfNeeded()
    }
    
    func updateViewLayoutWithAnimation(duration: NSTimeInterval = 0.5) {
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            self.layoutIfNeeded()
        })
    }
    
    func removeAllConstraints() {
        removeConstraints(constraints())
    }
}

/**
Uitility method to easily create UIColor object
*/
public func UIColorMake(red : Float, green : Float, blue : Float, alpha : CGFloat = 1) -> UIColor {
    return UIColor(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: alpha)
}

/**
Uitility method to easily create CGColor object
*/
public func CGColorMake(red : Float, green : Float, blue : Float, alpha : CGFloat = 1) -> CGColor {
    return UIColorMake(red, green, blue, alpha: alpha).CGColor
}

/**
Uitiltity method for creating single tap gesture recognizer.
*/
public func CreateSingleTapGestureRecognizer(target: AnyObject, action: Selector) -> UITapGestureRecognizer {
    var gc = UITapGestureRecognizer(target: target, action: action)
    gc.numberOfTouchesRequired = 1
    gc.numberOfTapsRequired = 1
    return gc
}

/**
Checks if the specified rect is a zero rect.
*/
func CGRectIsZeroRect(rect: CGRect) -> Bool {
    return CGRectEqualToRect(rect, CGRectZero)
}
