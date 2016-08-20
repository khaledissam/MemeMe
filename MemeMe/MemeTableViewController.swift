//
//  memeTableViewController.swift
//  MemeMe
//
//  Created by Minjie Zhu on 8/17/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    // MARK: - Variables/Constants
    var memes: [MemeModel] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    // MARK: - Actions
    @IBAction func addMeme(sender: AnyObject) {
        
        // Get the MemeViewController
        var controller: MemeViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeViewController") as! MemeViewController
        
        // present meme view controller
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle methods
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        self.tabBarController?.tabBar.hidden = false
    }
    
    
    // MARK: - Delegates methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell")!
        let meme = memes[indexPath.row]
        
        cell.textLabel?.text = meme.topStr + " -- " + meme.bottomStr
        cell.imageView?.image = meme.memeImage
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard = self.storyboard!
        let detailController = storyboard.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        self.tabBarController?.tabBar.hidden = true
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //For deleting the Meme
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:   UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        switch editingStyle {
        case .Delete:
            (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
        case .None:
            print("None")
        case .Insert:
            break
        }
        tableView.reloadData()
        
    }
}
