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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
