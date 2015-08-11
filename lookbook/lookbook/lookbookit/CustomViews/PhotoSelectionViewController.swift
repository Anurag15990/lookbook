//
//  PhotoSelectionViewController.swift
//  lookbook
//
//  Created by Anurag Agnihotri on 10/08/15.
//  Copyright (c) 2015 lookbook. All rights reserved.
//

import MobileCoreServices
import UIKit

class PhotoSelectionViewController : UIImagePickerController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cameraControlsView : CameraControlsView!
    
    override func viewDidLoad() {
        initializeView()
        showImageGallery()
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
    }
    
    
    private func capturePhoto() {
        takePicture()
        
    }
    
    func initializeView() {
        cameraControlsView = CameraControlsView()
        self.view.addSubview(cameraControlsView)
        cameraControlsView.openLibraryButton.addSingleTapGestureRecognizer(target: self, action: "showImageGallery")
        cameraControlsView.captureButton.addSingleTapGestureRecognizer(target: self, action: "capturePhoto")
    }
    
    private func showCamera() {
        sourceType = UIImagePickerControllerSourceType.Camera
        showsCameraControls = false
        delegate = self
    }
    
    private func showImageGallery() {
        sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        delegate = self
    }
    
    private func switchCamera(sender : AnyObject) {
     
        switch(cameraDevice) {
        case UIImagePickerControllerCameraDevice.Front:
            cameraDevice = UIImagePickerControllerCameraDevice.Rear
            break
        case UIImagePickerControllerCameraDevice.Rear:
            cameraDevice = UIImagePickerControllerCameraDevice.Front
            break
        default:
            break
        }
    
    }
    
    private func dismissView(sender : AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}

class CameraControlsView : SimpleAutoLayoutView {
    
    var openLibraryButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    var captureButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
        
    override func initalizeView() {
        backgroundColor = UIColorMake(21, 21, 21, alpha: 1.0)
        
        openLibraryButton.titleLabel?.font = UIFont.fontAwesomeOfSize(14)
        captureButton.titleLabel?.font = UIFont.fontAwesomeOfSize(14)
        
        openLibraryButton.setTitle(String.fontAwesomeIconWithName("fa-image"), forState: UIControlState.Normal)
        captureButton.setTitle(String.fontAwesomeIconWithName("fa-camera"), forState: UIControlState.Normal)
        
        
        
    }
    
    override func addConstraints() {
       
        LayoutConstraintsFactory(view : self)
        .setSizeOfView(openLibraryButton, width: 30, height: 21)
        .pinToLeadingEdgeInSuperveiw(openLibraryButton, constant: 8, respectMargin: false)
        .alignCenterXOfView(openLibraryButton, withView: self)
        .installConstraints()
        
        LayoutConstraintsFactory(view : self)
        .setSizeOfView(captureButton, width: 30, height: 21)
        .alignCenterXOfView(captureButton, withView: self)
        .alignCenterYOfView(captureButton, withView: self)
        .installConstraints()
        
        updateViewLayout()
    }
    
    
}
