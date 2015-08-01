//
//  Constants.swift
//  AcadamicSuggestion
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Nguyen Phuc Loc. All rights reserved.
//

import Foundation
import UIKit

// MARK: URL
let BaseUrl = "http://belifeu.com/api/v1"

struct URL{
    static let Register = "/sessions"
}

// MARK: Storyboard
struct Storyboard {
    static let Register     = "Register"
    static let Introduction = "Introduction"
    static let Questions    = "Questions"
    static let Result       = "Result"
    static let Suggestion   = "Suggestion"
}

// MARK: ViewControllerId
struct ViewControllerId{
  
}

// MARK: Common
let APP_DELEGATE = UIApplication.sharedApplication().delegate as! AppDelegate
let StatusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
let iosVersion = NSString(string: UIDevice.currentDevice().systemVersion).doubleValue
let iOS7 = floor(NSFoundationVersionNumber) <= floor(NSFoundationVersionNumber_iOS_7_1)
let iOS8OrHigher = floor(NSFoundationVersionNumber) > floor(NSFoundationVersionNumber_iOS_7_1)


// MARK: Device type & size
enum UIUserInterfaceIdiom : Int {
  case Unspecified
  case Phone
  case Pad
}

struct ScreenSize {
  static let Width      = UIScreen.mainScreen().bounds.size.width
  static let Height     = UIScreen.mainScreen().bounds.size.height
  static let MaxLength  = max(ScreenSize.Width, ScreenSize.Height)
  static let MinLength  = min(ScreenSize.Width, ScreenSize.Height)
}

struct DeviceType {
  static let IS_SIMULATOR        = UIDevice.currentDevice().model == "iPhone Simulator"
  static let IS_IPHONE_4_OR_LESS = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MaxLength < 568.0
  static let IS_IPHONE_5         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MaxLength == 568.0
  static let IS_IPHONE_6         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MaxLength == 667.0
  static let IS_IPHONE_6P        = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.MaxLength == 736.0
  static let IS_IPAD             = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.MaxLength == 1024.0
}
