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
    @IBOutlet weak var containerView : ContainerView!
    
    @IBOutlet weak var dislikeButton : UIButton!
    @IBOutlet weak var bookmarkButton : UIButton!
    
    
    
   
    var shirtsList = ["http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681031412004618240",
                      "http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681033997586595840",
                      "http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681030999686643712"]
    var tShirtsList = [String]()
    var pantsList = ["http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681034504395948032",
                    "http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681034478626078720",
                    "http://isaia-test.toovia.com:9195/media/thumbnail/int/sm/0/681010426770751498/681034452856209408"]
    
    
    var shirtsCounter : Int = 0
    var pantsCounter : Int = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImageViews(shirtsCounter, y: pantsCounter)
        
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
        
        bookmarkButton.setTitle(String.fontAwesomeIconWithName("fa-bookmark"), forState: UIControlState.Normal)
        bookmarkButton.titleLabel?.font = UIFont.fontAwesomeOfSize(40)
        
        dislikeButton.setTitle(String.fontAwesomeIconWithName("fa-thumbs-down"), forState: UIControlState.Normal)
        dislikeButton.titleLabel?.font = UIFont.fontAwesomeOfSize(40)
        
    }
    
    @IBAction func dislikeButtonClicked() {
        shirtsCounter = Int(arc4random_uniform(UInt32(shirtsList.count - 1)))
        pantsCounter = Int(arc4random_uniform(UInt32(pantsList.count - 1)))
        updateImageViews(shirtsCounter, y: pantsCounter)
    }
    
    private func updateImageViews(x : Int! , y : Int!) {
        imageView1.setImageWithUrl(shirtsList[x] as String, options: AsyncImageOptions.ShowAlways)
        imageView2.setImageWithUrl(pantsList[y], options: AsyncImageOptions.ShowAlways)
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
