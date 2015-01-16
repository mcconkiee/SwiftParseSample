//
//  UIAlert+EM.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit
extension UIAlertController{
    class func alertWithCancelOk(title:String!,msg:NSString!,closeWithStyle:(style:UIAlertActionStyle)->()) -> UIAlertController{
        let alert = UIAlertController(title: title,
            message: msg,
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action: UIAlertAction!) -> Void in
            
            closeWithStyle(style: UIAlertActionStyle.Cancel)
        }
        
        let okAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action: UIAlertAction!) -> Void in
            closeWithStyle(style: UIAlertActionStyle.Default)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        return alert
        
    }
    
    class func alertWithCancel(title:String!,msg:NSString!,closeWithStyle:(style:UIAlertActionStyle)->()) -> UIAlertController{
        let alert = UIAlertController(title: title,
            message: msg,
            preferredStyle: .Alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action: UIAlertAction!) -> Void in
            
            closeWithStyle(style: UIAlertActionStyle.Cancel)
        }
        
        alert.addAction(cancelAction)

        
        return alert
        
    }
    
    class func alertWithOk(title:String!,msg:NSString!,closeWithStyle:(style:UIAlertActionStyle)->()) -> UIAlertController{
        let alert = UIAlertController(title: title,
            message: msg,
            preferredStyle: .Alert)
        
        let ok = UIAlertAction(title: "Ok", style: .Default) { (action: UIAlertAction!) -> Void in
            
            closeWithStyle(style: UIAlertActionStyle.Default)
        }
        
        alert.addAction(ok)
        
        
        return alert
        
    }
}
