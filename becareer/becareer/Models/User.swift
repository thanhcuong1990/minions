//
//  User.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation

class User {
    var sName:String?
    var sEmail:String?
    var sAuthorToken:String?
    
    init(){
        self.sName = nil
        self.sEmail = nil
        self.sAuthorToken = nil
    }
    
    init(name:String, email:String, token:String){
        self.sName = name
        self.sEmail = email
        self.sAuthorToken = token
    }
    
    func parseUser(json:NSDictionary){
        self.sName = json.objectForKey("name") as? String
        self.sEmail = json.objectForKey("email") as? String
        self.sAuthorToken = json.objectForKey("auth_token") as? String
    }
}