//
//  SuggestionsViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 11/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import UIKit

class SuggestionsViewController: UIViewController {
    
    @IBOutlet weak var imageView1 : AsyncImageView!
    @IBOutlet weak var imageView2 : AsyncImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView1.setImageWithUrl("http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681033997586595840", options: AsyncImageOptions.ShowAlways)
        imageView2.setImageWithUrl("http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681034701965164544", options: AsyncImageOptions.ShowAlways)
        
        initializeView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initializeView() {
        imageView1.borderColor = UIColor.lightGrayColor().CGColor
        imageView1.borderWidth = 0.5
        
        imageView2.borderColor = UIColor.lightGrayColor().CGColor
        imageView2.borderWidth = 0.5
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
