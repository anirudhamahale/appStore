//
//  FeatureBannerTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/15/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class FeatureBannerTableViewCell: UITableViewCell {
    @IBOutlet weak var featureCollectionView: UICollectionView!
    
    var featureBannerTableViewCellDelegate: FeaturedViewController?
    
    var collectionViewOffset: CGFloat {
        set { featureCollectionView.contentOffset.x = newValue }
        get { return featureCollectionView.contentOffset.x }
    }
}

extension FeatureBannerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FeaturedBannerCollectionCell", forIndexPath: indexPath) as! FeaturedBannerCollectionCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = storyboard.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
        featureBannerTableViewCellDelegate!.navigationController?.pushViewController(vc, animated: true)
    }
    
}
