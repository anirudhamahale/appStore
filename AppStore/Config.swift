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

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
