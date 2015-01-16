//
//  LocalStoreUtility.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit

typealias OnLocalResults = (array:NSArray) ->()

class LocalStoreUtility: NSObject {
    class func flushObjects(withName:NSString){
        
    }
    class func getCommentsForUser(user:PFUser,callback:OnLocalResults){
        let q = PFQuery(className: "Comment")
        q.fromLocalDatastore()
        q.whereKey("user_id", equalTo: user)
        q.findObjectsInBackgroundWithBlock { (result:[AnyObject]!, error:NSError!) -> Void in
            callback(array: result as NSArray)
        }
    }
}
