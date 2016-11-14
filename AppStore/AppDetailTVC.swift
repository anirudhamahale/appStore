//
//  AppDetailTVC.swift
//  AppStore
//
//  Created by Anirudha on 13/11/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit
class SubltitleTableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
}

class ScreensTableCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCollections: UICollectionView!
    
}

class RatingReviewTableCell: UITableViewCell {
    @IBOutlet weak var segementController: UISegmentedControl!
}

class CustomerButtonTableCell: UITableViewCell {
    
}

class CustomerReviewsTableCell: UITableViewCell {
    @IBOutlet weak var reviewTitle: UILabel!
    @IBOutlet weak var user_date: UILabel!
    @IBOutlet weak var review: UILabel!
}