//
//  UpdatesTableViewCell.swift
//  AppStore
//
//  Created by LA Argon on 11/12/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class UpdatesTableViewCell: UITableViewCell {

    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var newLabel: UILabel!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

class UpdateTableViewCell: UITableViewCell {
    

}

class DetailUpdateTableViewCell: UITableViewCell {

    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    @IBOutlet weak var appButton: UIButton!
    @IBOutlet weak var appButtonWidth: NSLayoutConstraint!
}
