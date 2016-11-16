//
//  CategoryListViewController.swift
//  AppStore
//
//  Created by LA Argon on 11/16/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class CategoryListViewController: UIViewController {

    @IBOutlet weak var headerViewTopSpace: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    var navBarName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.title = navBarName
    }
    
    @IBAction func seeAllButtonPressed(sender: AnyObject) {
        let vc = storyboard?.instantiateViewControllerWithIdentifier("FeaturedListViewController") as! FeaturedListViewController
        vc.navTitle = "New Apps We Love"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryListTableCell") as! CategoryListTableCell
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        cell.FeatureTitle.text = "Business"
        return cell
    }
}

extension CategoryListViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryListCollectionViewCell", forIndexPath: indexPath) as! CategoryListCollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let vc = storyboard!.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
        vc.appName1 = "Clash of Clans"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CategoryListViewController {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if tableView.contentOffset.y >= 0 {
            headerViewTopSpace.constant = -tableView.contentOffset.y
            self.view.layoutIfNeeded()
        } else if tableView.contentOffset.y < 0 {
            headerViewTopSpace.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
}









