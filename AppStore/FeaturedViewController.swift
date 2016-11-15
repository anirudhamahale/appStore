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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func favouriteButtonPressed(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("FavouriteViewController") as! FavouriteViewController
        self.presentViewController(vc, animated: true, completion: nil)
    }

    @IBAction func seeAllButtonPressed(sender: AnyObject) {
        print(sender.tag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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















