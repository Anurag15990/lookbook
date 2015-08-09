
//
//  SimpleAutoLayoutView.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation

import UIKit

public class  SimpleAutoLayoutView : CustomView {
    
    private var didAddConstraints = false
    
    public override func initalizeView() {
        setTranslatesAutoresizingMaskIntoConstraints(false)
        setNeedsUpdateConstraints()
    }
    
    public override func updateConstraints() {
        super.updateConstraints()
        if !didAddConstraints {
            addConstraints()
            didAddConstraints = false
        }
    }
    
    public func addConstraints() {
        fatalError("Subclasses must inherit this.")
    }
}