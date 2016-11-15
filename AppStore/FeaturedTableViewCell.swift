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
    
    @IBOutlet weak var collectionView: UICollectionView!
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
}


