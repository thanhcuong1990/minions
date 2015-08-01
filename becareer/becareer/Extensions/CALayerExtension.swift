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
}