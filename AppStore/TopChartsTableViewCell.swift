//
//  TopChartsTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/1/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class TopChartsTableViewCell: UITableViewCell {

    @IBOutlet weak var rowNumber: UILabel!
    @IBOutlet weak var appImage: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appCategory: UILabel!
    @IBOutlet weak var appButton: UIButton!
    @IBOutlet weak var AppPurchase: UILabel!
    @IBOutlet weak var appDownloads: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
