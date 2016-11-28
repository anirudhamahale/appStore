//
//  AutoLayout.swift
//  Roomify
//
//  Created by Anirudha on 26/11/16.
//  Copyright © 2016 anirudha. All rights reserved.
//

import UIKit

let screenSize = UIScreen.mainScreen().bounds // App Screen Size
let storyboardSize: CGSize = CGSize(width: 375, height: 667)

func resizeDependingOnDevice(view: UIView) {
//    for constraint in view.constraints {
//        switch constraint.identifier ?? "" {
//        case "width":
//            constraint.constant = getCalculatedWidth(constraint.constant)
//        case "height":
//            constraint.constant = getCalculatedHeight(constraint.constant)
//        default:
//            break
//        }
//    }
//    
//    for tempView in view.subviews {
//        for constraint in tempView.constraints {
//            switch constraint.identifier ?? "" {
//            case "width":
//                constraint.constant = getCalculatedWidth(constraint.constant)
//            case "height":
//                constraint.constant = getCalculatedHeight(constraint.constant)
//            default:
//                break
//            }
//        }
//    }
    
    // A better way and performance
    // updating view constraints
    _ = view.constraints.filter{ $0.identifier == "height" }.map{ $0.constant = getCalculatedHeight($0.constant) }
    _ = view.constraints.filter{ $0.identifier == "width" }.map{ $0.constant = getCalculatedWidth($0.constant) }
    
    // updating subviews constraints
    _ = view.subviews.map{ $0.constraints.filter{ $0.identifier == "height" }.map{ $0.constant = getCalculatedHeight($0.constant) } }
    _ = view.subviews.map{ $0.constraints.filter{ $0.identifier == "width" }.map{ $0.constant = getCalculatedWidth($0.constant)} }
}

func getCalculatedWidth(constant: CGFloat) -> CGFloat {
    return screenSize.width * (constant/storyboardSize.width)
}

func getCalculatedHeight(constant: CGFloat) -> CGFloat {
    return screenSize.height * (constant/storyboardSize.height)
}