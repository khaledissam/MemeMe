//
//  memeCollectionViewController.swift
//  MemeMe
//
//  Created by Minjie Zhu on 8/17/16.
//  Copyright © 2016 Minjie Zhu. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var collectionFlow: UICollectionViewFlowLayout!
    
    // MARK: - Variables/Constants
    var memes: [MemeModel] {
        return (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    }
    
    // MARK: - Actions
    @IBAction func addMeme(sender: AnyObject) {
        
        // Get the DiceViewController
        var controller: MemeViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeViewController") as! MemeViewController
        
        // putsh to navigation
        presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: - Lifecycle methods
    override func viewWillAppear(animated: Bool) {
        self.collectionView?.reloadData()
        self.tabBarController?.tabBar.hidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space : CGFloat = 3.0
        let num : CGFloat = 2
        let dim = ((self.view.frame.size.width)-2*space) / num
        
        collectionFlow.minimumLineSpacing = 3.0
        collectionFlow.minimumInteritemSpacing = 5.0
        collectionFlow.itemSize = CGSizeMake(dim, dim)
    }
    
    
    // MARK: - Delegates methods
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionCell
        let meme = memes[indexPath.row]
        cell.memeImage.image = meme.memeImage

        
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = self.storyboard!
        let detailController = storyboard.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = memes[indexPath.row]
        self.tabBarController?.tabBar.hidden = true
        self.navigationController!.pushViewController(detailController, animated: true)
    }
}
