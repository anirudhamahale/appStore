//
//  CategoriesTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/4/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
}

class CategoryListTableCell: UITableViewCell {
    @IBOutlet weak var FeatureTitle: UILabel!
    @IBOutlet weak var seeAllButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
}
