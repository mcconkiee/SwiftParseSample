//
//  UserViewController.swift
//  ParseExample
//
//  Created by Eric McConkie on 1/15/15.
//  Copyright (c) 2015 ericmcconkie.com. All rights reserved.
//

import UIKit

class UserViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var dataSource:NSArray?
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onLogOut(sender: AnyObject) {
        PFUser.logOut()
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
    }
    override func viewDidLoad() {
        let nib = UINib(nibName: "CommentTableViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "cellid")
    }
    override func viewWillAppear(animated: Bool) {
        if let cu = PFUser.currentUser() as PFUser?{
            self.updateRemoteData()
        }
    }
    func updateRemoteData(){
        ApiUtility.getAllComments(PFUser.currentUser(), callback: { (result:AnyObject?, error:NSError?) -> Void in
            if let results = result as NSArray?{
                self.updateUI()
            }
        })
    }
    func updateUI(){
        LocalStoreUtility.getCommentsForUser(PFUser.currentUser(), callback: { (array:NSArray?) -> () in
            if let ar = array as NSArray?{
                self.dataSource = ar
                self.tableView.reloadData()
            }
        })
    }
   
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var ct : Int = 0
        if let ds = self.dataSource as NSArray?{
            ct = ds.count
        }
        return ct
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var  cell :UITableViewCell?
        if let acell = tableView.dequeueReusableCellWithIdentifier("cellid") as? CommentTableViewCell{
            cell = acell
            
            let obj = self.dataSource?.objectAtIndex(indexPath.row) as PFObject
            print(obj)
            acell.lblComment.text = obj.objectForKey("comment") as NSString
            acell.lblDate.text = obj.createdAt.description
        }
        
        return cell!
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            let obj = self.dataSource?.objectAtIndex(indexPath.row) as PFObject
            
            ApiUtility.deleteObject(obj, callback: { (success:Bool  , error:NSError?) -> Void in
                if success{
                    self.updateRemoteData()
                }
            })
        }
    }
}
