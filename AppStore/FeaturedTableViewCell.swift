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
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}

class FeatureBannerTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
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





















