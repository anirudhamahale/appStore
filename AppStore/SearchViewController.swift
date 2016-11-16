//
//  SearchViewController.swift
//  AppStore
//
//  Created by LA Argon on 10/31/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    let trending = ["paytm", "dvpc", "paytm app", "narendra modi app", "aaj tak live", "toi, twitter", "times of india", "mobile strike", "twitte for iphone"]
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search"
        searchBar.searchBarStyle = UISearchBarStyle.Minimal // search bar to 0x96969b color
        searchBar.tintColor = UIColor(netHex: 0x96969b)
        searchBar.delegate = self
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = searchBar
        self.title = "Search"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(sender: AnyObject) {
        let button = sender as! UIButton
//        print(button.titleLabel?.text ?? "")
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier("AppDetailViewController") as! AppDetailViewController
        vc.appName1 = button.titleLabel?.text ?? "Star Wars"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print(searchBar.text!)
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trending.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SearchTableViewCell") as! SearchTableViewCell
        cell.titleButton.setTitle(trending[indexPath.row], forState: .Normal)
        return cell
    }
}

