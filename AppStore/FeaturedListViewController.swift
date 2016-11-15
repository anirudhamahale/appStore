
//
//  FeaturedListViewController.swift
//  AppStore
//
//  Created by LA Argon on 11/15/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class FeaturedListViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var segementController: UISegmentedControl!
    var segmnetIndex = 0
    var navTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let navBar = navigationController!.navigationBar
        navBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navBar.shadowImage = UIImage()
        self.title = navTitle
    }
    
    @IBAction func segementButtonPressed(sender: AnyObject) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension FeaturedListViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeaturedListTableCell") as! FeaturedListTableCell
        cell.getButton.layer.borderColor = UIColor(netHex: 0x007aff).CGColor
        return cell
    }

}














