//
//  ApparelTypeSelectionViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 06/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import UIKit

class ApparelTypeSelectionViewController: UIViewController{
    
    var showPhotoSignal : ((signal : Bool) -> Void)?
    var senderViewController : UIViewController!

    @IBAction func uploadShirts() {
        selectPhoto()
    }
    
    @IBAction func uploadPants() {
        selectPhoto()
    }
    
    @IBAction func uploadTShirts() {
        selectPhoto()
    }
    
    func selectPhoto() {
        dismissViewControllerAnimated(true, completion: nil)
        showPhotoSignal?(signal: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSingleTapGestureRecognizer(target: self, action: "dismissView")
        // Do any additional setup after loading the view.
    }
    
    func dismissView() {
        dismissViewControllerAnimated(true, completion: nil)
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
