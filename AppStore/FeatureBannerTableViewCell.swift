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
}
