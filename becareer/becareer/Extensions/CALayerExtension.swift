//
//  CALayerExtension.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation
import UIKit

extension CALayer{
    
    func addBorderCorner(color:UIColor, corner:CGFloat, width:CGFloat){
        self.borderColor = color.CGColor
        self.borderWidth = width
        self.cornerRadius = corner
    }
    
    func addBottomLine(color:UIColor, width:CGFloat){
        var bottomLine = CALayer()
        var bottomLineFrame:CGRect = self.bounds
        bottomLineFrame.origin.x = 0
        bottomLineFrame.origin.y = self.bounds.size.height - width
        bottomLineFrame.size.width = ScreenSize.MaxLength
        bottomLineFrame.size.height = width
        bottomLine.frame = bottomLineFrame
        bottomLine.backgroundColor = color.CGColor
        self.addSublayer(bottomLine)
    }
    
    func addTopLine(color:UIColor, width:CGFloat){
        var bottomLine = CALayer()
        var bottomLineFrame:CGRect = self.bounds
        bottomLineFrame.origin.x = 0
        bottomLineFrame.origin.y = 0
        bottomLineFrame.size.width = ScreenSize.MaxLength
        bottomLineFrame.size.height = width
        bottomLine.frame = bottomLineFrame
        bottomLine.backgroundColor = color.CGColor
        self.addSublayer(bottomLine)
    }
    
    func addPushLeftAnimation(){
        var pushAnimation = CATransition()
        pushAnimation.duration = 0.3
        pushAnimation.type = kCATransitionPush
        pushAnimation.subtype = kCATransitionFromLeft
        self.addAnimation(pushAnimation, forKey: nil)
    }
    
    func addPushRightAnimation(){
        var pushAnimation = CATransition()
        pushAnimation.duration = 0.3
        pushAnimation.type = kCATransitionPush
        pushAnimation.subtype = kCATransitionFromRight
        self.addAnimation(pushAnimation, forKey: nil)
    }
}