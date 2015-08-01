//
//  APIResponse.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation
struct APIResponse {
    var success: Bool = false
    var dataObject: NSDictionary?
    var status: Int = 200
    var message: String = ""
    
    //initializer
    init(fromJsonObject json:NSDictionary?){
        if (json!["success"] != nil) {
            self.success = json!["success"] as! Bool
            
            if (!self.success == true && json!["status"] != nil) {
                self.status = json!["status"] as! Int
                self.message = json!["message"] as! String
            }
            else {
                self.dataObject = json!["data"] as? NSDictionary
            }
        }
    }
    
}