//
//  FeatureBannerTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/15/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class FeatureBannerTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}
