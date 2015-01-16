//
//  CreateCommentViewController.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit

class CreateCommentViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func onSend(sender: AnyObject) {
        
        //create and save a comment to Parse cloud
        ApiUtility.createComment(self.textView.text, callback: { (success, error) -> () in
            var ttle = "Saved!"
            var msg = "Your comment was saved"
            if error != nil{
                ttle = "Error"
                msg = error!.localizedDescription
            }
            let alert = UIAlertController.alertWithOk(ttle, msg: msg, closeWithStyle: { (style) -> () in
                
            })
            self.presentViewController(alert, animated: true, completion: { () -> Void in
                
            })
        })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
