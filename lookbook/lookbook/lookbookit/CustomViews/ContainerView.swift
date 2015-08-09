//
//  ContainerView.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 09/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation
import UIKit

class ContainerView : SimpleAutoLayoutView {
    
    override func initalizeView() {
        borderColor = UIColor.lightGrayColor().CGColor
        borderWidth = 0.5
        layer.shadowColor = UIColorMake(138, 138, 138,alpha: 1.0).CGColor
        layer.shadowOffset = CGSizeMake(0, 0)
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 2.0
    }
}