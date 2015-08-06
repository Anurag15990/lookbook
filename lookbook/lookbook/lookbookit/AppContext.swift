//
//  AppContext.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 06/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation

@objc public class AppContext {
    
    public struct AppContextData {
       static var sharedUserDefaults : SharedUserDefaults!
    }
    
    public class func initalize() {
        AppContextData.sharedUserDefaults = SharedUserDefaults()
    }
    
    public class var sharedUserDefaults : SharedUserDefaults {
        get { return AppContextData.sharedUserDefaults}
    }
}
