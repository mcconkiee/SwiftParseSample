//
//  ViewController.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    var user : PFUser?
    @IBOutlet weak var tfUser: UITextField!
    @IBOutlet weak var tfPass: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let uu = PFUser.currentUser() as PFUser?{
            self.user = uu
            self.performSegueWithIdentifier("SegueLoginToUserComments", sender: self)
            
        }
    }

    
    @IBAction func onLoginTap(sender: AnyObject) {
        ApiUtility.login(tfUser.text, passwd: tfPass.text) { (user, error) -> () in
            if error != nil{
                UIAlertController.alertWithOk("Unable to login", msg: "Ther server was not able to authenticate your credentials", closeWithStyle: { (style) -> () in
                    
                })
            }
            if let u = user as PFUser?{
                self.performSegueWithIdentifier("SegueLoginToUserComments", sender: self)
            }
    }
    }
  

}

