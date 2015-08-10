//
//  LayoutConstraintsFactory.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation
import UIKit

public class LayoutConstraintsFactory {
    
    weak var view : UIView?
    public var constraints = [NSLayoutConstraint]()
    var views: [NSObject: AnyObject]?
    
    public init() {}
    
    public init(view : UIView, views: [NSObject: AnyObject]? = nil) {
        self.view = view
        self.views = views
    }
    
    var count : Int {
        get { return constraints.count }
    }
    
    public func activateConstraints() {
        NSLayoutConstraint.activateConstraints(constraints)
    }
    
    public func deactivateConstraints() {
        NSLayoutConstraint.deactivateConstraints(constraints)
    }
    
    public func installConstraints() {
        view?.addConstraints(constraints)
    }
    
    public func uninstallConstraints() {
        view?.removeConstraints(constraints)
    }
    
    public func clearConstraints() {
        view?.removeConstraints(constraints)
        constraints.removeAll(keepCapacity: false)
    }
    
    public func removeAll() {
        constraints.removeAll(keepCapacity: false)
    }
    
    public func setPriorityOfLastConstraint(priority: UILayoutPriority) -> LayoutConstraintsFactory {
        if constraints.count > 0 {
            constraints.last?.priority = priority
        }
        return self
    }
    
    public func constraintsWithFormat(format: String) -> LayoutConstraintsFactory {
        if views != nil {
            constraints += NSLayoutConstraint.constraintsWithVisualFormat(format,
                options: nil,
                metrics: nil,
                views: views!) as! [NSLayoutConstraint]
        } else {
            fatalError("Views dictionary not set")
        }
        return self
    }
    
    public func pinToTopEdgeInSuperveiw(view : UIView, constant : CGFloat = 0, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: respectMargin ? NSLayoutAttribute.TopMargin : NSLayoutAttribute.Top,
            multiplier: 1,
            constant: constant))
        return self
    }
    
    public func pinToBottomEdgeInSuperveiw(view : UIView, constant : CGFloat = 0, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: respectMargin ? NSLayoutAttribute.BottomMargin : NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: -constant))
        return self
    }
    
    public func pinToLeadingEdgeInSuperveiw(view : UIView, constant : CGFloat = 0, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Leading,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: respectMargin ? NSLayoutAttribute.LeadingMargin : NSLayoutAttribute.Leading,
            multiplier: 1,
            constant: constant))
        return self
    }
    
    public func pinToTrailingEdgeInSuperveiw(view : UIView, constant : CGFloat = 0, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Trailing,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view.superview,
            attribute: respectMargin ? NSLayoutAttribute.TrailingMargin : NSLayoutAttribute.Trailing,
            multiplier: 1,
            constant: -constant))
        return self
    }
    
    public func placeAtBottomInSuperview(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: .Bottom,
            relatedBy: .LessThanOrEqual,
            toItem: view.superview,
            attribute: respectMargin ? .BottomMargin : .Bottom,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func placeAtTopInSuperview(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: .Top,
            relatedBy: .LessThanOrEqual,
            toItem: view.superview,
            attribute: respectMargin ? .TopMargin : .Top,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func fillWidthOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToLeadingEdgeInSuperveiw(view, respectMargin: respectMargin)
        pinToTrailingEdgeInSuperveiw(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillHeightOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToTopEdgeInSuperveiw(view, respectMargin: respectMargin)
        pinToBottomEdgeInSuperveiw(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        fillWidthOfParent(view, respectMargin: respectMargin)
        fillHeightOfParent(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillTopOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToTopEdgeInSuperveiw(view, respectMargin: respectMargin)
        fillWidthOfParent(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillBottomOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToBottomEdgeInSuperveiw(view, respectMargin: respectMargin)
        fillWidthOfParent(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillTrailingSideOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToTrailingEdgeInSuperveiw(view, respectMargin: respectMargin)
        fillHeightOfParent(view, respectMargin: respectMargin)
        return self
    }
    
    public func fillLeadingSideOfParent(view : UIView, respectMargin: Bool = true) -> LayoutConstraintsFactory {
        pinToLeadingEdgeInSuperveiw(view, respectMargin: respectMargin)
        fillHeightOfParent(view, respectMargin: respectMargin)
        return self
    }
    
    public func invisibleToTopInSuperview(view : UIView) -> LayoutConstraintsFactory {
        pinToTopEdgeInSuperveiw(view)
        setHeightOfView(view, height: 0)
        return self
    }
    
    public func invisibleToBottomInSuperview(view : UIView) -> LayoutConstraintsFactory {
        pinToBottomEdgeInSuperveiw(view)
        setHeightOfView(view, height: 0)
        return self
    }
    
    public func invisibleToLeadingInSuperView(view :UIView) -> LayoutConstraintsFactory {
        pinToLeadingEdgeInSuperveiw(view)
        setWidthOfView(view, width: 0)
        return self
    }
    
    public func invisibleToTrailingInSuperView(view :UIView) -> LayoutConstraintsFactory {
        pinToTrailingEdgeInSuperveiw(view)
        setWidthOfView(view, width: 0)
        return self
    }
    
    public func makeWidthRelativeToParent(view: UIView, factor : CGFloat = 1, constant : CGFloat = 0) -> LayoutConstraintsFactory {
        var parent = view.superview!
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: parent,
            attribute: NSLayoutAttribute.Width,
            multiplier: factor,
            constant: -(parent.layoutMargins.top + parent.layoutMargins.bottom) + constant))
        return self
    }
    
    public func makeHeightRelativeToParent(view: UIView, factor : CGFloat = 1, constant : CGFloat = 0) -> LayoutConstraintsFactory {
        var parent = view.superview!
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: parent,
            attribute: NSLayoutAttribute.Height,
            multiplier: factor,
            constant: -(parent.layoutMargins.top + parent.layoutMargins.bottom) + constant))
        return self
    }
    
    public func makeWidthOfView(view: UIView, sameAs: UIView, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: sameAs,
            attribute: NSLayoutAttribute.Width,
            multiplier: 1,
            constant: constant))
        return self
    }
    
    public func makeHeightOfView(view: UIView, sameAs: UIView, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: sameAs,
            attribute: NSLayoutAttribute.Height,
            multiplier: 1,
            constant: constant))
        return self
    }
    
    public func makeHeightOfView(view: UIView, lessThanOrEqualTo: UIView, factor: CGFloat = 1, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: lessThanOrEqualTo,
            attribute: NSLayoutAttribute.Height,
            multiplier: factor,
            constant: constant))
        return self
    }
    
    public func makeHeightOfView(view: UIView, greaterThanOrEqualTo: UIView, factor: CGFloat = 1, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
            toItem: greaterThanOrEqualTo,
            attribute: NSLayoutAttribute.Height,
            multiplier: factor,
            constant: constant))
        return self
    }
    
    public func makeWidthOfView(view: UIView, lessThanOrEqualTo: UIView, factor: CGFloat = 1, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: lessThanOrEqualTo,
            attribute: NSLayoutAttribute.Width,
            multiplier: factor,
            constant: constant))
        return self
    }
    
    public func makeWidthOfView(view: UIView, greaterThanOrEqualTo: UIView, factor: CGFloat = 1, constant: CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.GreaterThanOrEqual,
            toItem: greaterThanOrEqualTo,
            attribute: NSLayoutAttribute.Width,
            multiplier: factor,
            constant: constant))
        return self
    }
    
    public func makeWidthOfView(view: UIView, relativeToView: UIView, factor: CGFloat) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: relativeToView,
            attribute: NSLayoutAttribute.Width,
            multiplier: factor,
            constant: 0))
        return self
    }
    
    
    public func alignCenterYOfView(view: UIView, withView: UIView) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.CenterY,
            relatedBy: NSLayoutRelation.Equal,
            toItem: withView,
            attribute: NSLayoutAttribute.CenterY,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func alignCenterXOfView(view: UIView, withView: UIView) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.CenterX,
            relatedBy: NSLayoutRelation.Equal,
            toItem: withView,
            attribute: NSLayoutAttribute.CenterX,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func makeWidthRelativeToHeightForView(view : UIView ,factor : CGFloat = 1.0) -> LayoutConstraintsFactory{
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Height,
            multiplier: factor,
            constant: 0))
        return self
        
    }
    
    public func makeHeightRelativeToWidthForView(view : UIView ,factor : CGFloat = 1.0) -> LayoutConstraintsFactory{
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: factor,
            constant: 0))
        return self
        
    }
    
    public func fixHeigthWidthRatio(view: UIView, heightFactor: CGFloat, widthFactor: CGFloat) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: view,
            attribute: NSLayoutAttribute.Width,
            multiplier: heightFactor / widthFactor,
            constant: 0))
        return self
    }
    
    public func floatToTopInParent(parent: UIView, view: UIView) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: parent,
            attribute: NSLayoutAttribute.TopMargin,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func sinkToBottomInParent(parent: UIView, view: UIView) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.LessThanOrEqual,
            toItem: parent,
            attribute: NSLayoutAttribute.BottomMargin,
            multiplier: 1,
            constant: 0))
        return self
    }
    
    public func placeView(view : UIView, above : UIView, constant : CGFloat = UIView.interViewSpacing, reciprocate: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: above,
            attribute: NSLayoutAttribute.Top,
            multiplier: 1,
            constant: -constant))
        
        if reciprocate {
            placeView(above, below: view, constant: constant, reciprocate: false)
        }
        return self
    }
    
    public func placeView(view : UIView, below : UIView, constant : CGFloat = UIView.interViewSpacing, reciprocate: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Top,
            relatedBy: NSLayoutRelation.Equal,
            toItem: below,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: constant))
        
        if reciprocate {
            placeView(below, above: view, constant: constant, reciprocate: false)
        }
        return self
    }
    
    public func placeView(view : UIView, leftOf : UIView, constant : CGFloat = UIView.interViewSpacing, reciprocate: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Right,
            relatedBy: NSLayoutRelation.Equal,
            toItem: leftOf,
            attribute: NSLayoutAttribute.Left,
            multiplier: 1,
            constant: -constant))
        
        if reciprocate {
            placeView(leftOf, rightOf: view, constant: constant, reciprocate: false)
        }
        return self
    }
    
    public func placeView(view : UIView, rightOf : UIView, constant : CGFloat = UIView.interViewSpacing, reciprocate: Bool = true) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Left,
            relatedBy: NSLayoutRelation.Equal,
            toItem: rightOf,
            attribute: NSLayoutAttribute.Right,
            multiplier: 1,
            constant: constant))
        
        if reciprocate {
            placeView(rightOf, leftOf: view, constant: constant, reciprocate: false)
        }
        return self
    }
    
    public func alignBottomOfView(view : UIView, withView : UIView, constant : CGFloat = 0) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Bottom,
            relatedBy: NSLayoutRelation.Equal,
            toItem: withView,
            attribute: NSLayoutAttribute.Bottom,
            multiplier: 1,
            constant: constant))
        return self
    }
    
    public func setHeightOfView(view : UIView, height : CGFloat) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Height,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: height))
        return self
    }
    
    public func setSizeOfView(view : UIView, width : CGFloat, height : CGFloat) -> LayoutConstraintsFactory {
        setHeightOfView(view, height: height)
        setWidthOfView(view, width: width)
        return self
    }
    
    public func setWidthOfView(view : UIView, width : CGFloat) -> LayoutConstraintsFactory {
        constraints.append(NSLayoutConstraint(
            item: view,
            attribute: NSLayoutAttribute.Width,
            relatedBy: NSLayoutRelation.Equal,
            toItem: nil,
            attribute: NSLayoutAttribute.NotAnAttribute,
            multiplier: 1,
            constant: width))
        return self
    }
}