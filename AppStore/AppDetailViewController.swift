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
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    @IBOutlet weak var segmentControllerView: UIView!
    @IBOutlet weak var segmentControllerTopSpace: NSLayoutConstraint!
    var segmentIndex = 0
    
    var appName1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentController.addTarget(self, action: #selector(AppDetailViewController.changeValueForSegment(_:)), forControlEvents: .ValueChanged)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        appName.text = appName1
        removeNavigationBarBottomLine(false, self: self)
    }
    
    @IBAction func changeValueForSegment(sender: UISegmentedControl) {
        segmentIndex = sender.selectedSegmentIndex
        
        UIView.transitionWithView(appDetailTV, duration: 0.3, options: [.TransitionCrossDissolve], animations: {
            self.appDetailTV.reloadData()
            }, completion: nil)
    }
    
    @IBAction func shareButtonPressed(sender: AnyObject) {
        let textToShare = "Swift is awesome!  Check out this website about it!"
        
        if let myWebsite = NSURL(string: "http://www.codingexplorer.com/") {
            let objectsToShare = [textToShare, myWebsite]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
//            activityVC.popoverPresentationController?.sourceView = sender as? UIView
            self.presentViewController(activityVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func reviewButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func writeReviewButtonPressed(sender: AnyObject) {
        
    }
    
    @IBAction func appSupportButtonPressed(sender: AnyObject) {
        
    }
    
}


extension AppDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        switch segmentIndex {
        case 0:
            /********************* Details Page *********************/
            return 4
        case 1:
            /********************* Reviews Page *********************/
            return 3
        case 2:
            /********************* Related Page *********************/
            return 1
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentIndex {
        case 0:
            /********************* Details Page *********************/
            return 1
        case 1:
            /********************* Reviews Page *********************/
            return section == 2 ? 5:1
        case 2:
            /********************* Related Page *********************/
            return 5
        default:
            return 0
        }
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
            switch indexPath.section {
            case 0:
                return 210
            case 1:
                return 80
            case 2:
                return 140
            default:
                return 0
            }
            
        case 2:
            /********************* Related Page *********************/
            return 220
        default:
            return 0
        }
    }
    
//    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return section == 0 ? 50: 0
//    }
//    
//    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
//        createSectionHeaderView(view)
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch segmentIndex {
        case 0:
            /********************* Details Page *********************/
            switch indexPath.section {
            case 0, 2, 3:
                let cell = tableView.dequeueReusableCellWithIdentifier("SubltitleTableCell") as! SubltitleTableCell
                configureDetailsCells(cell, indexPath: indexPath)
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
            switch indexPath.section {
            case 0:
                let cell = tableView.dequeueReusableCellWithIdentifier("RatingReviewTableCell") as! RatingReviewTableCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCellWithIdentifier("CustomerButtonTableCell") as! CustomerButtonTableCell
                return cell
            case 2:
                let cell = tableView.dequeueReusableCellWithIdentifier("CustomerReviewsTableCell") as! CustomerReviewsTableCell
                return cell
            default:
            return UITableViewCell()
            }
        case 2:
            /********************* Related Page *********************/
            let cell = tableView.dequeueReusableCellWithIdentifier("RelatedTableCell") as! RelatedTableCell
            cell.appsCollection.dataSource = self
            cell.appsCollection.delegate = self
            return cell
            
        default:
            return UITableViewCell()
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
        switch segmentIndex {
        case 0:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ScreenShotsCVC", forIndexPath: indexPath) as! ScreenShotsCVC
            cell.screen.image = UIImage(named: "clashOfClansVertical")
            return cell
        default:
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RelatedCollectionCell", forIndexPath: indexPath) as! RelatedCollectionCell
            return cell
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if segmentIndex == 2 {
            let vc = storyboard!.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
            vc.appName1 = "Clash of Clans"
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension AppDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if appDetailTV.contentOffset.y >= 125 {
            segmentControllerTopSpace.constant = 0
            segmentControllerView.backgroundColor = UIColor(hexString: "#F5F5F5")
        } else if appDetailTV.contentOffset.y < 125 {
            segmentControllerTopSpace.constant = 124 - appDetailTV.contentOffset.y
            segmentControllerView.backgroundColor = UIColor.clearColor()
        }
    }
}

// Helper methods
extension AppDetailViewController {
    func configureDetailsCells(cell: UITableViewCell, indexPath: NSIndexPath) {
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
            let date = "02-Nov-2016"
            let text = NSMutableAttributedString(string: "What's New\n\(date)")
            text.addAttribute(NSForegroundColorAttributeName, value: UIColor.darkGrayColor(), range: NSRange(location:10,length:12))
            cell.titleLabel.attributedText = text
            cell.descriptionLabel.text = "* This version contains stability improvements and general bug fixes."
        default:
            break
        }
    }
    
//    func configureReviewPageCell(cell: UITableViewCell, indexPath: NSIndexPath) {
//        switch indexPath.section {
//        case 0:
//            let cell = cell as! RatingReviewTableCell
//            
//        default:
//            break
//        }
//    }
    
    /*
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
            var mutableString: String = label.text!
            var trimmedString = mutableString.stringByReplacingCharactersInRange(NSMakeRange(<#T##loc: Int##Int#>, <#T##len: Int##Int#>), withString: <#T##String#>)
            
        }
    }
     
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

















