//
//  FeaturedViewController.swift
//  AppStore
//
//  Created by LA Argon on 10/31/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class FeaturedViewController: UIViewController {

    @IBOutlet weak var featuredTableView: UITableView!
    @IBOutlet weak var headerViewTopSpace: NSLayoutConstraint!
    var storedOffsets = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...9 {
            storedOffsets.append(0)
        }
        // Do any additional setup after loading the view.
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidAppear(animated: Bool) {
        self.setNeedsStatusBarAppearanceUpdate()
        super.viewDidAppear(animated)
    }
    
    @IBAction func favouriteButtonPressed(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("FavouriteViewController") as! FavouriteViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

    @IBAction func seeAllButtonPressed(sender: AnyObject) {
        print(sender.tag)
        self.performSegueWithIdentifier("ListFeatured", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ListFeatured" {
            let vc = FeaturedListViewController()
            vc.navTitle = "New Apps We Love"
        }
    }
}

extension FeaturedViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 2,3,6,7:
            return 127
        default:
            return 225
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 2,3,6,7:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeatureBannerTableViewCell") as! FeatureBannerTableViewCell
            cell.featureCollectionView.dataSource = cell
            cell.featureCollectionView.delegate = cell
            return cell
        default:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeaturedTableViewCell") as! FeaturedTableViewCell
            cell.FeatureTitle.text = "New Games We Love"
            cell.seeAllButton.tag = indexPath.row
            cell.collectionView.dataSource = cell
            cell.collectionView.delegate = cell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 2,3,6,7:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeatureBannerTableViewCell") as! FeatureBannerTableViewCell
            cell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        default:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeaturedTableViewCell") as! FeaturedTableViewCell
            cell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        }
    }
    
    func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 2,3,6,7:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeatureBannerTableViewCell") as! FeatureBannerTableViewCell
            storedOffsets[indexPath.row] = cell.collectionViewOffset
        default:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeaturedTableViewCell") as! FeaturedTableViewCell
            storedOffsets[indexPath.row] = cell.collectionViewOffset
        }
    }
}

extension FeaturedViewController {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if featuredTableView.contentOffset.y >= 0 {
            headerViewTopSpace.constant = -featuredTableView.contentOffset.y
            self.view.layoutIfNeeded()
        } else if featuredTableView.contentOffset.y < 0 {
            headerViewTopSpace.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
}















