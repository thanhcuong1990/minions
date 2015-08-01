//
//  Networking.swift
//  becareer
//
//  Created by Nguyen Phuc Loc on 8/1/15.
//  Copyright (c) 2015 Minions. All rights reserved.
//

import Foundation
import Foundation
import UIKit


class Networking {
    
    //MARK: Type Alias
    typealias Headers = Dictionary<String, String>
    typealias Params = Dictionary<String, AnyObject>
    
    
    class var sharedInstance : Networking {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : Networking? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = Networking()
        }
        return Static.instance!
    }
    
    
    //MARK: GET Method
    func getAndReturnDictionary(url : String, params: Params?, headers: Headers?, postCompleted: (success: Bool,apiResponse:APIResponse) -> ()) {
        
        let requestParams = NSURL(string: appendParamsToUrl(url, params: params))
        var request = NSMutableURLRequest(URL: requestParams!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "GET"
        var err: NSError?
        
        // add the post headers
        if (headers != nil) {
            request.allHTTPHeaderFields = headers!
        }
        
        //create the task
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            //capture the response
            if let httpResponse = response as? NSHTTPURLResponse {
                //get the status code
                var statusCode:Int  = httpResponse.statusCode
                var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
                var err: NSError?
                var json = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(0), error: &err) as? NSDictionary
                
                if (statusCode == 200) {
                    let apiResponse = APIResponse(fromJsonObject:json!)
                    postCompleted(success:true, apiResponse:apiResponse)
                } else {
                    let apiResponse = APIResponse(fromJsonObject: self.getHttpStatusError(statusCode))
                    postCompleted(success:false, apiResponse:apiResponse)
                }
            } else {
                let apiResponse = APIResponse(fromJsonObject: self.getNetworkError(error))
                postCompleted(success: false, apiResponse:apiResponse)
            }
            
        })
        task.resume()
    }
    
    
    //MARK: POST
    func postAndReturnDictionary(url: String, params : Params?, headers: Headers?,  postCompleted : (success: Bool, apiResponse:APIResponse) -> ()) {
        
        var request = NSMutableURLRequest(URL: NSURL(string: url)!)
        var session = NSURLSession.sharedSession()
        request.HTTPMethod = "POST"
        var err: NSError?
        
        // add the post parameters
        if params != nil {
            request.HTTPBody = NSJSONSerialization.dataWithJSONObject(params!, options: nil, error: &err)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        
        // add the post headers
        if (headers != nil) {
            request.allHTTPHeaderFields = headers!
        }
        
        //create the task
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error -> Void in
            //capture the response
            if let httpResponse = response as? NSHTTPURLResponse {
                //get the status code
                var statusCode:Int  = httpResponse.statusCode
                var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
                var err: NSError?
                var json = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions(0), error: &err) as? NSDictionary
                
                if (statusCode == 200) {
                    let apiResponse = APIResponse(fromJsonObject:json!)
                    postCompleted(success:true, apiResponse:apiResponse)
                } else {
                    let apiResponse = APIResponse(fromJsonObject: self.getHttpStatusError(statusCode))
                    postCompleted(success:false, apiResponse:apiResponse)
                }
            } else {
                let apiResponse = APIResponse(fromJsonObject: self.getNetworkError(error))
                postCompleted(success: false, apiResponse:apiResponse)
            }
        })
        task.resume()
    }
    
    //MARK: - Private Methods
    func appendParamsToUrl(url: String, params: Params? = nil) -> String{
        var fullUrl = url
        //add the post parameters
        if params != nil {
            fullUrl += "?"
            var i: Int = 0
            for (p, v) in params! {
                if i == 0 {
                    fullUrl += "\(p)=\(v)"
                } else {
                    fullUrl += "&\(p)=\(v)"
                }
                i++
            }
        }
        return fullUrl.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)!
    }
    
    //MARK: Get http common errors
    func getHttpStatusError(code: Int) -> NSDictionary {
        var errorMessage:String = ""
        switch code {
        case 400:
            errorMessage = NSLocalizedString("Bad Request.", comment: "")
        case 401:
            errorMessage = NSLocalizedString("Unauthorized.", comment: "")
        case 403:
            errorMessage = NSLocalizedString("Forbidden.", comment: "")
        case 404:
            errorMessage = NSLocalizedString("Not Found.", comment: "")
        case 408:
            errorMessage = NSLocalizedString("Request Timeout.", comment: "")
        case 500:
            errorMessage = NSLocalizedString("Internal Server Error.", comment: "")
        case 502:
            errorMessage = NSLocalizedString("Bad Gateway.", comment: "")
        case 503:
            errorMessage = NSLocalizedString("Service Unavailable.", comment: "")
        default:
            errorMessage = NSLocalizedString("Something went wrong.", comment: "")
        }
        
        let errorResponse:NSDictionary = ["success": false, "status": code, "message": errorMessage]
        return errorResponse
    }
    
    //MARK: Get network errors
    func getNetworkError(error: NSError) -> NSDictionary {
        var errorMessage:String = ""
        switch error.code {
        case NSURLErrorUnknown:
            errorMessage = NSLocalizedString("An unknown error occurred.", comment: "")
        case NSURLErrorCancelled:
            errorMessage = NSLocalizedString("The connection was cancelled.", comment: "")
        case NSURLErrorBadURL:
            errorMessage = NSLocalizedString("The connection failed due to a malformed URL.", comment: "")
        case NSURLErrorTimedOut:
            errorMessage = NSLocalizedString("The connection timed out.", comment: "")
        case NSURLErrorUnsupportedURL:
            errorMessage = NSLocalizedString("The connection failed due to an unsupported URL scheme.", comment: "")
        case NSURLErrorCannotFindHost:
            errorMessage = NSLocalizedString("The connection failed because the host could not be found.", comment: "")
        case NSURLErrorCannotConnectToHost:
            errorMessage = NSLocalizedString("The connection failed because a connection cannot be made to the host.", comment: "")
        case NSURLErrorNetworkConnectionLost:
            errorMessage = NSLocalizedString("The connection failed because the network connection was lost.", comment: "")
        case NSURLErrorDNSLookupFailed:
            errorMessage = NSLocalizedString("The connection failed because the DNS lookup failed.", comment: "")
        case NSURLErrorHTTPTooManyRedirects:
            errorMessage = NSLocalizedString("The HTTP connection failed due to too many redirects.", comment: "")
        case NSURLErrorResourceUnavailable:
            errorMessage = NSLocalizedString("The connection’s resource is unavailable.", comment: "")
        case NSURLErrorNotConnectedToInternet:
            errorMessage = NSLocalizedString("Device is not connected to the internet.", comment: "")
        case NSURLErrorRedirectToNonExistentLocation:
            errorMessage = NSLocalizedString("The connection was redirected to a nonexistent location.", comment: "")
        case NSURLErrorBadServerResponse:
            errorMessage = NSLocalizedString("The connection received an invalid server response.", comment: "")
        case NSURLErrorUserCancelledAuthentication:
            errorMessage = NSLocalizedString("The connection failed because the user cancelled required authentication.", comment: "")
        case NSURLErrorUserAuthenticationRequired:
            errorMessage = NSLocalizedString("The connection failed because authentication is required.", comment: "")
        case NSURLErrorZeroByteResource:
            errorMessage = NSLocalizedString("The resource retrieved by the connection is zero bytes.", comment: "")
        case NSURLErrorCannotDecodeContentData:
            errorMessage = NSLocalizedString("The connection cannot decode data encoded with a known content encoding.", comment: "")
        case NSURLErrorCannotDecodeContentData:
            errorMessage = NSLocalizedString("The connection cannot decode data encoded with an unknown content encoding.", comment: "")
        case NSURLErrorCannotParseResponse:
            errorMessage = NSLocalizedString("The connection cannot parse the server’s response.", comment: "")
        case NSURLErrorInternationalRoamingOff:
            errorMessage = NSLocalizedString("The connection failed because international roaming is disabled on the device.", comment: "")
        case NSURLErrorCallIsActive:
            errorMessage = NSLocalizedString("The connection failed because a call is active.", comment: "")
            
        case NSURLErrorDataNotAllowed:
            errorMessage = NSLocalizedString("The connection failed because data use is currently not allowed on the device.", comment: "")
        case NSURLErrorRequestBodyStreamExhausted:
            errorMessage = NSLocalizedString("The connection failed because its request’s body stream was exhausted.", comment: "")
        default:
            errorMessage = NSLocalizedString("Something went wrong.", comment: "")
        }
        let errorResponse:NSDictionary = ["success": false, "status": error.code, "message": errorMessage]
        return errorResponse
    }
    
}