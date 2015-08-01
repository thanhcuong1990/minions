//
//  APIClient.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation

class APIClient {
    
    class var sharedInstance : APIClient {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : APIClient? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = APIClient()
        }
        return Static.instance!
    }
    
    func register(name:String, email:String, completed: (responseObj:User) -> ()){
        let params:Dictionary<String, String> = ["name" : name,"email" : email]
        Networking.sharedInstance.postAndReturnDictionary(BaseUrl.stringByAppendingString(URL.Register), params: params, headers: nil) { (success, apiResponse) -> () in
            var uTemp = User()
            uTemp.parseUser(apiResponse.dataObject!.objectForKey("user") as! NSDictionary)
            completed(responseObj:uTemp)
        }
    }
}