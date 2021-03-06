//
//  TopChartsViewController.swift
//  AppStore
//
//  Created by LA Argon on 10/31/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class TopChartsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var data = [AppDetails]()
    @IBOutlet weak var topChartsTableView: UITableView!
    
    @IBOutlet weak var lineViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resizeDependingOnDevice(view)
        data = [
            AppDetails(name: "Clash of Clans", category: .Games, image: "angrybirdsspace", downloads: "50000", free: false, price: "250"),
            AppDetails(name: "Clash of Royals", category: .Games, image: "clashroyale", downloads: "10091", free: true, price: "150")
        ]
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        removeNavigationBarBottomLine(true, self: self)
    }
    
    override func viewDidLayoutSubviews() {
        lineViewHeight.constant = 0.5
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return getCalculatedHeight(94)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = topChartsTableView.dequeueReusableCellWithIdentifier("TopChartsTableViewCell") as! TopChartsTableViewCell
        configureTopChartsTableViewCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showApp", sender: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func configureTopChartsTableViewCell(cell: TopChartsTableViewCell, indexPath: NSIndexPath) {
        cell.rowNumber.text = "\(indexPath.row+1)"
        cell.appName.text = data[indexPath.row].name
        cell.appCategory.text = returnAppCategoryToString(data[indexPath.row].category)
        data[indexPath.row].free ? (cell.AppPurchase.alpha = 0.0) : (cell.AppPurchase.alpha = 1.0)
        let temp = "\(data[indexPath.row].downloads)"
        cell.appImage.image = UIImage(named: data[indexPath.row].image)
        cell.appDownloads.text = temp
        cell.appButton.setTitle("₹ " + data[indexPath.row].price, forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
