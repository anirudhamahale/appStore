//
//  Config.swift
//  AppStore
//
//  Created by LA Argon on 11/1/16.
//  Copyright © 2016 LA Argon. All rights reserved.
//

import Foundation
import UIKit

struct AppDetails {
    let name: String
    let category: AppCategories
    let image: String
    let downloads: String
    let free: Bool
    let price: String
 
    init(name: String, category: AppCategories, image: String, downloads: String, free: Bool, price: String) {
        self.name = name
        self.category = category
        self.image = image
        self.downloads = downloads
        self.free = free
        self.price = price
    }
}

func returnAppCategoryToString(category: AppCategories) -> String {
    switch category {
    case .Books:
        return "Books"
    case .Games:
        return "Games"
    case .Movies:
        return "Movies"
    case .Music:
        return "Music"
    case .Social:
        return "Social"
    case .Travel:
        return "Travel"
    }
}

enum AppCategories {
    case Games
    case Social
    case Music
    case Movies
    case Books
    case Travel
}

func removeNavigationBarBottomLine(remove: Bool, self: UIViewController) {
    for parent in self.navigationController!.navigationBar.subviews {
        for childView in parent.subviews {
            if(childView is UIImageView) {
                childView.alpha = remove ? 0.0 : 1.0
            }
        }
    }
}
