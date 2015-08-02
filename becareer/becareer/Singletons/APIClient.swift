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
    
    func questions(user:User, completed:(questions:Array<NSDictionary>) -> ()){
        let headers:Dictionary<String, String> = ["Auth-Token" : user.sAuthorToken!,"Auth-Email" : user.sEmail!]
        Networking.sharedInstance.getAndReturnDictionary(BaseUrl.stringByAppendingString(URL.Questions), params: nil, headers: headers) { (success, apiResponse) -> () in
            completed(questions: apiResponse.dataObject!.objectForKey("questions") as! Array<NSDictionary>)
        }
    }
    
    func result(user:User, answer:Array<Int>, completed:(questions:Array<NSDictionary>) -> ()){
        let params:Dictionary<String, Array<Int>> = ["results" : answer]
        let headers:Dictionary<String, String> = ["Auth-Token" : user.sAuthorToken!,"Auth-Email" : user.sEmail!]
        Networking.sharedInstance.postAndReturnDictionary(BaseUrl.stringByAppendingString(URL.Result), params: params, headers: headers) { (success, apiResponse) -> () in
            completed(questions: apiResponse.dataObject!.objectForKey("results") as! Array<NSDictionary>)
        }
    }
    
    func universities(user:User, majorId:Int, completed:(universities:Array<NSDictionary>) -> ()){
        let params:Dictionary<String, Int> = ["type" : majorId]
        let headers:Dictionary<String, String> = ["Auth-Token" : user.sAuthorToken!,"Auth-Email" : user.sEmail!]
        Networking.sharedInstance.getAndReturnDictionary(BaseUrl.stringByAppendingString(URL.Universities), params: params, headers: headers) { (success, apiResponse) -> () in
            completed(universities: apiResponse.dataObject!.objectForKey("universities") as! Array<NSDictionary>)
        }
        
    }
}