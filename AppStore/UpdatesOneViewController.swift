//
//  UpdatesOneViewController.swift
//  AppStore
//
//  Created by LA Argon on 11/12/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class UpdatesOneViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentController: UISegmentedControl!
    
    var all = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segementController(sender: AnyObject) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            all = true
        default:
            all = false
        }
        UIView.transitionWithView(self.tableView, duration: 0.3, options: [.TransitionCrossDissolve], animations: {
            self.tableView.reloadData()
            }, completion: nil)
    }
}

extension UpdatesOneViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DetailUpdateTableViewCell") as! DetailUpdateTableViewCell
        configureCell(cell)
        return cell
    }
    
    func configureCell(cell: DetailUpdateTableViewCell) {
        if all {
            cell.appIcon.image = UIImage(named: "")
            cell.appButton.backgroundColor = UIColor.clearColor()
            cell.appButton.layer.cornerRadius = 5
            cell.appButton.layer.borderWidth = 1
            cell.appButton.layer.borderColor = UIColor(netHex: 0x297AFE).CGColor
            cell.appButton.setTitle("Open", forState: .Normal)
            cell.appButton.setImage(nil, forState: .Normal)
        } else {
            let image = UIImage(named: "Cloud_Download")
            cell.appButton.setImage(image, forState: .Normal)
            cell.appButton.setTitle("", forState: .Normal)
            cell.appButton.layer.borderColor = UIColor.clearColor().CGColor
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}







