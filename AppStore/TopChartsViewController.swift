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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            AppDetails(name: "Clash of Clans", category: .Games, image: "angrybirdsspace", downloads: "50000", free: false, price: "250"),
            AppDetails(name: "Clash of Royals", category: .Games, image: "clashroyale", downloads: "10091", free: true, price: "150")
        ]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
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
        cell.appButton.backgroundColor = UIColor.clearColor()
        cell.appButton.layer.cornerRadius = 5
        cell.appButton.layer.borderWidth = 2
        cell.appButton.layer.borderColor = UIColor(netHex: 0x297AFE).CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
