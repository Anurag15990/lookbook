//
//  UserDefaultsBase.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 06/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation


public class UserDefaultsBase {
    
    public func getNSUserDefaults() -> NSUserDefaults {
        fatalError("This Method should be implemented by derived class")
    }
    
    func getBoolForKey(key : String) -> Bool {
        return getNSUserDefaults().boolForKey(key)
    }
    
    func setBool(value : Bool, forKey : String) {
        getNSUserDefaults().setBool(value, forKey: forKey)
    }
    
    func getStringForKey(key : String) -> String {
        return getNSUserDefaults().stringForKey(key)!
    }
    
    func setString(value : String, forKey : String) {
        getNSUserDefaults().setObject(value, forKey: forKey)
    }
    
    func setObject(value : String, forKey : String) {
        getNSUserDefaults().setObject(value, forKey: forKey)
    }
    
    func getObject(key : String) -> AnyObject {
        return getNSUserDefaults().objectForKey(key)!
    }
}