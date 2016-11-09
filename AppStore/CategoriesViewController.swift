//
//  ExploreViewController.swift
//  AppStore
//
//  Created by LA Argon on 10/31/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesTableView: UITableView!
    
    let categories = [["Games","Photo & Video","Entertainment"],["Books","Business","Catalogues","Education","Entertaintment","Developer Tools","Life Style", "Health & Fitness", "Medical", "Weather", "Travel", "Videos", "Utilities", "Sports", "Photography", "Social Networking", "Productivity"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesTableView.sectionHeaderHeight = 60.0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return categories[0].count
        case 1:
            return categories[1].count
        default:
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCellWithIdentifier("CategoriesTableViewCell") as! CategoriesTableViewCell
        cell.appIcon.image = UIImage(named: "clashroyale")
        cell.appName.text = categories[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let title = UILabel()
        title.font = UIFont(name: "Helvetica", size: 17)
        title.textColor = UIColor.lightGrayColor()
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.font=title.font
        header.textLabel?.textColor=title.textColor
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "POPULAR"
        case 1:
            return "ALL CATEGORIES"
        default:
            return ""
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}














