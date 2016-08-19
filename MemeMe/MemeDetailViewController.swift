//
//  MemeDetailViewController.swift
//  MemeMe
//
//  Created by Minjie Zhu on 8/17/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    
    var meme : MemeModel?
    
    override func viewWillAppear(animated: Bool) {
        if let meme = meme {
            imageView.image = meme.memeImage
            
        }
    }

    @IBAction func editMeme(sender: AnyObject) {
        let storyboard = self.storyboard!
        let editorController = storyboard.instantiateViewControllerWithIdentifier("MemeViewController") as! MemeViewController
        editorController.currentMeme = meme
        presentViewController(editorController, animated: true, completion: nil)
    }
}
