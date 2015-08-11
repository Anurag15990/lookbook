//
//  MainViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 06/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func initializeNavigationBar() {
        self.title = "Suggestions"
        var rightBarButton = UIBarButtonItem(title: "Add Photo", style: UIBarButtonItemStyle.Plain, target: self, action: "uploadImage")
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func uploadImage() {
        var viewController = ApparelTypeSelectionViewController(nibName: "ApparelTypeSelectionViewController", bundle: nil)
        viewController.senderViewController = self
        viewController.showPhotoSignal = showPhotoView
        viewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(viewController, animated: true, completion: nil)
    }
    
    func showPhotoView(signal : Bool) {
        var viewController = PhotoSelectionViewController()
        presentViewController(viewController, animated: true, completion: nil)
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
