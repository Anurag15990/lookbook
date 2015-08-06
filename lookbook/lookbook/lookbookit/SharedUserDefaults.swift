//
//  SharedUserDefaults.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 06/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation

import Foundation

public class SharedUserDefaults: UserDefaultsBase {
    
    public struct Consts {
     
        static let USER_LOGGED_IN = "UserLoggedIn"
        static let USER_NAME = "UserName"
        static let EMAIL = "email"
    }
    
    public var logedin : Bool {
        set { setBool(newValue, forKey: Consts.USER_LOGGED_IN) }
        get { return getBoolForKey(Consts.USER_LOGGED_IN) }
    }
    
    public var userName: String {
        get { return getStringForKey(Consts.USER_NAME) }
        set { setString(newValue, forKey: Consts.USER_NAME) }
    }
    
    public var email: String {
        get { return getStringForKey(Consts.EMAIL) }
        set { setString(newValue, forKey: Consts.EMAIL) }
    }
    
    public override func getNSUserDefaults() -> NSUserDefaults {
        return NSUserDefaults.standardUserDefaults()
    }
    
    public func clearAllData(){
        var dictionary = NSUserDefaults.standardUserDefaults().dictionaryRepresentation()
        for key in dictionary.keys{
            NSUserDefaults.standardUserDefaults().removeObjectForKey(key as! String)
        }
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    
}

