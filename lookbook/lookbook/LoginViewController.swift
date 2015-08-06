//
//  LoginViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 05/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import Foundation
import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var tabView : UIView!
    @IBOutlet weak var signInView : UIView!
    @IBOutlet weak var signInEmailTextField : UITextField!
    @IBOutlet weak var signInPasswordTextField : UITextField!
    @IBOutlet weak var forgotPasswordButton : UIButton!
    @IBOutlet weak var signInButton : UIButton!
    @IBOutlet weak var signInFacebookView : FBSDKLoginButton!
    @IBOutlet weak var signInFacebookIconLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
