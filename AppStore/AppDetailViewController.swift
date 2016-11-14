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
    
    @IBOutlet weak var appDetailTV: UITableView!
    
    lazy var segmentController: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Details","Reviews","Related"])
        view.tintColor = UIColor.darkGrayColor()
        view.selectedSegmentIndex = 0
        view.setEnabled(true, forSegmentAtIndex: 0)
        return view
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(netHex: 0xf0f0f0)
        view.alpha = 0.7
        return view
    }()
    
    var segmentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentController.addTarget(self, action: #selector(AppDetailViewController.changeValueForSegment(_:)), forControlEvents: .ValueChanged)
    }

    func createSectionHeaderView(view: UIView) {
        let sectionView = view as! UITableViewHeaderFooterView
        sectionView.contentView.backgroundColor = UIColor.whiteColor()
        
        segmentController.frame = CGRect(x: 10, y: 5, width: sectionView.contentView.bounds.width - 20, height: sectionView.contentView.bounds.height - 10)
        lineView.frame = CGRect(x: 0, y: sectionView.contentView.bounds.height - 1, width: sectionView.contentView.bounds.width, height: 1)
        
        sectionView.contentView.addSubview(segmentController)
        sectionView.contentView.addSubview(lineView)
    }
    
    func changeValueForSegment(sender: UISegmentedControl) {
        print(sender.selectedSegmentIndex)
        segmentIndex = sender.selectedSegmentIndex
        appDetailTV.reloadData()
    }
}


extension AppDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch segmentIndex {
        case 0:
            /********************* Details Page *********************/
            switch indexPath.section {
            case 0, 2, 3:
                let cell = tableView.dequeueReusableCellWithIdentifier("SubltitleTableCell") as! SubltitleTableCell
                configureCells(cell, indexPath: indexPath)
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("ScreensTableCell") as! ScreensTableCell
                cell.titleLabel.text = "iPhone"
                cell.imageCollections.dataSource = self
                cell.imageCollections.delegate = self
                return cell
            default:
                return UITableViewCell()
            }
        case 1:
            /********************* Reviews Page *********************/
            return UITableViewCell()
            
        case 2:
            /********************* Related Page *********************/
            return UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
        
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        createSectionHeaderView(view)
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 40: 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch segmentIndex {
        case 0:
            /********************* Details Page *********************/
            switch indexPath.section {
            case 0, 2, 3:
                return 100
            case 1:
                return 350
            default:
                return 0
            }
        case 1:
            /********************* Reviews Page *********************/
            return 0
            
        case 2:
            /********************* Related Page *********************/
            return 0
            
        default:
            return 0
        }
    }
}

extension AppDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ScreenShotsCVC", forIndexPath: indexPath) as! ScreenShotsCVC
        cell.screen.image = UIImage(named: "clashOfClansVertical")
        return cell
    }
}

// Helper methods
extension AppDetailViewController {
    func configureCells(cell: UITableViewCell, indexPath: NSIndexPath) {
        let cell = cell as! SubltitleTableCell
        switch indexPath.section {
        case 0:
            cell.titleLabel.numberOfLines = 1
            cell.titleLabel.text = "App Store Editors' Note"
            cell.descriptionLabel.text = "defaults to NO. If YES, when focusing on a table view the last focused index path is focused automatically. If the table view has never been focused, then the preferred focused index path is used."
        case 2:
            cell.titleLabel.numberOfLines = 1
            cell.titleLabel.text = "Description"
            cell.descriptionLabel.text = "The Clan Description is the one and only thing new members and potential recruits will see. You can set up your basic rules in there and you don’t have to send them via Clan Message all the time. Let’s say you’re currently looking for a new Clan and you come across various Clans and you read the description. Which of the following Clans would you rather join?"
        case 3:
            cell.titleLabel.numberOfLines = 2
            
            let text1 = NSMutableAttributedString(string: "02-Nov-2016")
            text1.addAttribute(NSForegroundColorAttributeName, value: UIColor.yellowColor(), range: NSRange(location:0,length:11))
            
            cell.titleLabel.text = "What's New\n\(text1)"
            cell.descriptionLabel.text = "* This version contains stability improvements and general bug fixes."
        default:
            break
        }
    }
    
    func calculateLines(label: UILabel) {
        // calculating number of lines
        let textSize = CGSizeMake(label.frame.size.width, CGFloat(Float.infinity))
        let rHeight = lroundf(Float(label.sizeThatFits(textSize).height))
        let charSize = lroundf(Float(label.font.lineHeight))
        let lineCount = rHeight/charSize
        
        if lineCount < 5 {
            
        } else {
            var attributedString = NSMutableAttributedString(string: " ...Read More")
            attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.blueColor(), range: NSRange(location:0,length:13))
            
        }
    }
    
    /*
    func addReadMoreStringToUILabel(label: UILabel) {
        var readMoreText = " ...Read More"
        var lengthForString = label.text!.characters.count
        if lengthForString >= 30 {
            var lengthForVisibleString = label.sizeThatFits(CGSize(width: label.frame.size.width, height: CGFloat(Float.infinity)))
            var mutableString: String = label.text!
            var trimmedString = mutableString.stringByReplacingCharactersInRange(NSMakeRange(lengthForVisibleString, (label.text!.characters.count - lengthForVisibleString)), withString: "")
            var readMoreLength = readMoreText.characters.count
            var trimmedForReadMore = trimmedString.stringByReplacingCharactersInRange(NSMakeRange((trimmedString.characters.count - readMoreLength), readMoreLength), withString: "")
            var answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSFontAttributeName: label.font])
            var readMoreAttributed = NSMutableAttributedString(string: readMoreText, attributes: [NSFontAttributeName: Font(TWRegular, 12.0), NSForegroundColorAttributeName: White])
            answerAttributed.appendAttributedString(readMoreAttributed)
            label.attributedText = answerAttributed
            var readMoreGesture = UITagTapGestureRecognizer(target: self, action: #selector(self.readMoreDidClickedGesture))
            readMoreGesture.tag = 1
            readMoreGesture.numberOfTapsRequired = 1
            label.addGestureRecognizer(readMoreGesture)
            label.userInteractionEnabled = true
        }
        else {
            print("No need for 'Read More'...")
        }
    }
 */
}

















