//
//  UIViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 12/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    public func showMessage(message : String) {
        Alert(showIn: self).showMessage(message, title: "Lookbook")
    }
}

extension UIAlertController {
    
    convenience init(title : String, message : String) {
        self.init(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    }
    
    func addOkAction(handler : ((UIAlertAction!) -> Void)!) {
        self.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: handler))
    }
    
    func addCancelAction(handler : ((UIAlertAction!) -> Void)!) {
        self.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: handler))
    }
}

class Alert {
    
    private var parentViewController : UIViewController
    
    init(showIn : UIViewController) {
        self.parentViewController = showIn
    }
    
    func showMessage(message : String, title : String) {
        showMessage(message, title: title, handler : nil)
    }
    
    func showMessage(message : String, title : String, handler : ((UIAlertAction!) -> Void)!) {
        var alert = UIAlertController(title: title, message : message)
        alert.addOkAction(handler)
        alert.dismissViewControllerAnimated(false, completion: nil)
        parentViewController.presentViewController(alert, animated : true, completion : nil)
    }
}