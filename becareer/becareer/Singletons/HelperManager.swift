//
//  HelperManager.swift
//  muse
//
//  Created by Cuong Lam on 22/12/14.
//  Copyright (c) 2014 BE Studio. All rights reserved.
//

import Foundation
import UIKit


class HelperManager {
    
    class var sharedInstance : HelperManager {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : HelperManager? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = HelperManager()
        }
        return Static.instance!
    }
    
    //MARK: Validation
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(testStr)
        return result
    }
    
    //MARK: Base64
    func imageURLToBase64String(imageURLString:String) ->String {
        var baseUrl: String = imageURLString
        var imgURL: NSURL = NSURL(string: baseUrl)!
        var imgData: NSData = NSData(contentsOfURL: imgURL)!
        let base64String = imgData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)
        return base64String
    }
    
    func dataToBase64String(imageData:NSData) ->String {
        let base64String = imageData.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.EncodingEndLineWithCarriageReturn)
        return base64String
    }
    
    //MARK: Easy functions
    func getAppVersion() ->String {
        let appVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        return appVersion
    }
    
    func setAnimationFromTop(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionFade
        transition.subtype = kCATransitionFromTop
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    func setAnimationFromBottom(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromTop
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    func setAnimationFromLeft(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    func setAnimationFromRight(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    func setAnimationToLeft(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    func setAnimationToBottom(viewController: UIViewController) {
        var transition:CATransition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromBottom
        viewController.view.window!.layer.addAnimation(transition, forKey: kCATransition)
    }
    
    // MARK: Format time
    func stringFromTimeInterval(totalSeconds: Float64) -> String {
        if totalSeconds > 0 {
            let seconds = Int(totalSeconds % 60)
            let minutes = Int((totalSeconds / 60) % 60)
            let hours = Int(totalSeconds / 3600)
            
            let strHours = "\(hours)"
            var strMinutes = "\(minutes)"
            strMinutes = minutes > 9 ? "\(minutes)" : "0\(minutes)"
            let strSeconds = seconds > 9 ? "\(seconds)" : "0\(seconds)"
            
            if hours > 0 {
                return "\(strHours):\(strMinutes):\(strSeconds)"
            } else {
                return "\(strMinutes):\(strSeconds)"
            }
        } else {
            return "00:00"
        }
    }
    
    // MARK: Utilities
    func getDirectoryFor(directoryName:String) -> String {
        let documentDir = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        let directory = documentDir.stringByAppendingPathComponent(directoryName)
        
        // Create download folder if it does not exits.
        if !NSFileManager.defaultManager().fileExistsAtPath(directory) {
            NSFileManager.defaultManager().createDirectoryAtPath(directory, withIntermediateDirectories: true, attributes: nil, error: nil)
        }
        return directory
    }
    
    func removeFileAtPath(path:String) {
        if NSFileManager.defaultManager().fileExistsAtPath(path) {
            NSFileManager.defaultManager().removeItemAtPath(path, error: nil)
        }
    }
}
