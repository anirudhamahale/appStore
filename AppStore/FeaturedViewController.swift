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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = featuredTableView.dequeueReusableCellWithIdentifier("FeaturedTableViewCell") as! FeaturedTableViewCell
        cell.FeatureTitle.text = "New Games We Love"
        cell.seeAllButton.tag = indexPath.row
        cell.collectionView.dataSource = self
        cell.collectionView.delegate = self
        return cell
    }

}

extension FeaturedViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeaturedCollectionViewCell", forIndexPath: indexPath) as! FeaturedCollectionViewCell
        cell.appImage.image = UIImage(named: "clashroyale")
        cell.appName.text = "Clash Of Royale"
        cell.appCategory.text = "Games"
        return cell
    }
}















