//
//  APIUtility.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit
typealias OnResultCallback = (result:AnyObject?,error:NSError?) -> Void
typealias OnSuccessCallback = (success:Bool,error:NSError?) -> Void
class ApiUtility: NSObject{
    func setupParse(){
        Parse.enableLocalDatastore()
        Parse.setApplicationId("bzfBSlKGe18WqxyBH8itNLwtpLoZeJDCILmb9UoG", clientKey: "e0CgZFKRkaXdLNB2iNdwogXdfIusyPXiJXHHhuf9")
    }
    class func login(username:NSString,passwd:NSString,callback:(user:AnyObject?,error:NSError?)->()){
        PFUser.logInWithUsernameInBackground(username, password: passwd) { (user: PFUser!, error:NSError!) -> Void in
            callback(user:user,error:error)
        }
    }
    class func getObjectWithId(className:NSString,idd:NSString,callback:OnResultCallback){
        let q = PFQuery(className: className)
        q.getObjectInBackgroundWithId(idd, block: { (object:PFObject!, error:NSError!) -> Void in
            callback(result:object,error:error)
        })
    }
    
    class func deleteObject(obj:PFObject,callback:OnSuccessCallback){
        obj.deleteInBackgroundWithBlock { (flag:Bool, error:NSError!) -> Void in
            callback(success: flag, error: error)
        }
    }
    
    //MARK: Comments
    class func getAllComments(user:PFUser,callback:OnResultCallback){
        PFCloud.callFunctionInBackground("getCommentsForUser", withParameters: ["user_id":user.objectId]) { (result:AnyObject!, error:NSError!) -> Void in
            
            //save to DB
            if let ar = result as NSArray?{
                for idx in ar{
                    let bl = idx.pin()
                    
                }
            }
            callback(result: result, error: error)
            
        }
    }
    class func createComment(comment:NSString,callback:OnSuccessCallback){
        let object = PFObject(className: "Comment")
        object["comment"] = comment
        object["user_id"] = PFUser.currentUser()
        object.saveInBackgroundWithBlock { (success:Bool, error:NSError!) -> Void in
            callback(success: success, error: error)
        }
    }
    
}
