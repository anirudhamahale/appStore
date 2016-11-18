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
    
    @IBOutlet weak var headerView: UIView!
    
    var storedOffsets = [CGFloat]()
    var navigationBarOriginalOffset: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0...9 {
            storedOffsets.append(0)
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBarBottomLine(false, self: self)
        navigationBarOriginalOffset = headerView.frame.origin.y
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
            let vc = segue.destinationViewController as! FeaturedListViewController
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
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeatureBannerTableViewCell", forIndexPath: indexPath) as! FeatureBannerTableViewCell
            cell.collectionView.tag = 2000
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            return cell
        default:
            let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeaturedTableViewCell", forIndexPath: indexPath) as! FeaturedTableViewCell
            cell.collectionView.tag = 1000
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
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

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1000 {
            return 7
        } else if collectionView.tag == 2000 {
            return 4
        } else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1000 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeaturedCollectionViewCell", forIndexPath: indexPath) as! FeaturedCollectionViewCell
            return cell
        } else if collectionView.tag == 2000 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeaturedBannerCollectionCell", forIndexPath: indexPath) as! FeaturedBannerCollectionCell
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView.tag == 1000 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
            vc.appName1 = "Clash of Clans"
            self.navigationController?.pushViewController(vc, animated: true)
        } else if collectionView.tag == 2000 {
            let vc = storyboard?.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
            vc.appName1 = "dr. Seuss"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension FeaturedViewController {
    func scrollViewDidScroll(scrollView: UIScrollView) {
//        if featuredTableView.contentOffset.y >= 0 {
//            headerViewTopSpace.constant = -featuredTableView.contentOffset.y
//            self.view.layoutIfNeeded()
//        } else if featuredTableView.contentOffset.y < 0 {
//            headerViewTopSpace.constant = 0.0
//            self.view.layoutIfNeeded()
//        }
        
        print(-min(navigationBarOriginalOffset!, featuredTableView.contentOffset.y))
        headerView.frame.origin.y = -min(navigationBarOriginalOffset!+60, featuredTableView.contentOffset.y-60)
    }
}















