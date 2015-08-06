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
import FBSDKCoreKit
import FBSDKShareKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet weak var tabView : UIView!
    @IBOutlet weak var signInView : UIView!
    @IBOutlet weak var signInEmailTextField : UITextField!
    @IBOutlet weak var signInPasswordTextField : UITextField!
    @IBOutlet weak var forgotPasswordButton : UIButton!
    @IBOutlet weak var signInButton : UIButton!
    @IBOutlet weak var signInFacebookView : FBSDKLoginButton!
    @IBOutlet weak var signInFacebookIconLabel : UILabel!
    
    var viewWillAppearExecuted = false
    
    override func viewDidAppear(animated: Bool) {
        viewWillAppearExecuted = true
        if AppContext.sharedUserDefaults.logedin {
            var viewController = storyboard?.instantiateViewControllerWithIdentifier("MainTabBarController") as! MainViewController
            presentViewController(viewController, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInFacebookView.readPermissions = ["email", "public_profile"]
        self.signInFacebookView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        if result != nil && !result.isCancelled {
            
            AppContext.sharedUserDefaults.logedin = true
            if (FBSDKAccessToken.currentAccessToken() != nil) {
                var request = FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "email, name"])
                request.startWithCompletionHandler({(connection, result1, error) -> Void in
                    if result != nil {
                        AppContext.sharedUserDefaults.userName = ((result1 as! NSDictionary)["name"] as! String)
                        AppContext.sharedUserDefaults.email = ((result1 as! NSDictionary)["email"] as! String)
                    }
                })
                
                
            }
            if viewWillAppearExecuted {
                var viewController = storyboard?.instantiateViewControllerWithIdentifier("MainTabBarController") as! MainViewController
                presentViewController(viewController, animated: false, completion: nil)
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        AppContext.sharedUserDefaults.clearAllData()
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
