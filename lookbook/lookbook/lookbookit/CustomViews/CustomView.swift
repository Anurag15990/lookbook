//
//  CustomView.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation

import UIKit

public class CustomView : UIView {
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initalizeView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initalizeView()
    }
    
    public func initalizeView() {
        //Subclasses must inherit this
    }
}