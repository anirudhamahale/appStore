//
//  FeaturedTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/2/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class FeaturedTableViewCell: UITableViewCell {

    @IBOutlet weak var FeatureTitle: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    
    var featuredViewControllerDelegate: FeaturedViewController?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}

extension FeaturedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeaturedCollectionViewCell", forIndexPath: indexPath) as! FeaturedCollectionViewCell
        cell.appImage.image = UIImage(named: "clashroyale")
        cell.appName.text = "Clash Of Royale"
        cell.appCategory.text = "Games"
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = storyboard.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
        featuredViewControllerDelegate!.navigationController?.pushViewController(vc, animated: true)
    }
}

class FeaturedListTableCell: UITableViewCell {
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var starView: UIView!
}



















