//
//  AppDetailViewController.swift
//  AppStore
//
//  Created by Anirudha on 13/11/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class AppDetailViewController: UIViewController {

    @IBOutlet weak var appIcon: UIImageView!
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var appCompany: UILabel!
    @IBOutlet weak var appStatus: UILabel!
    @IBOutlet weak var appReview: UILabel!
    @IBOutlet weak var appStars: UIView!
    @IBOutlet weak var appComments: UILabel!
    @IBOutlet weak var appButton: UIButton!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var segmentControllerView: UIView!
    @IBOutlet weak var appDetailTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createSectionHeaderView(view: UIView) {
        let sectionView = view as! UITableViewHeaderFooterView
//        sectionView.contentView.backgroundColor = UIColor.yellowColor()
        
        let segmentController: UISegmentedControl = {
            let view = UISegmentedControl()
            view.frame = CGRect(x: 10, y: 10, width: sectionView.contentView.bounds.width - 20, height: sectionView.contentView.bounds.height - 20)
            view.setTitle("Details", forSegmentAtIndex: 0)
            view.setTitle("Reviews", forSegmentAtIndex: 1)
            view.setTitle("Related", forSegmentAtIndex: 2)
            view.tintColor = UIColor.darkGrayColor()
            view.selectedSegmentIndex = 0
            view.setEnabled(true, forSegmentAtIndex: 0)
            return view
        }()
        
        sectionView.contentView.addSubview(segmentController)
        
////        segmentController.widthAnchor.constraintEqualToAnchor(sectionView.contentView.widthAnchor, multiplier: 0.8).active = true
//        segmentController.centerXAnchor.constraintEqualToAnchor(sectionView.contentView.centerXAnchor).active = true
//        segmentController.centerYAnchor.constraintEqualToAnchor(sectionView.contentView.centerYAnchor).active = true

    }
}


extension AppDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCellWithIdentifier("EditorsNotesTableCell") as! EditorsNotesTableCell
            cell.noteLabel.text = "defaults to NO. If YES, when focusing on a table view the last focused index path is focused automatically. If the table view has never been focused, then the preferred focused index path is used."
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        createSectionHeaderView(view)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 50
        default:
            return 0
        }
    }
}

















