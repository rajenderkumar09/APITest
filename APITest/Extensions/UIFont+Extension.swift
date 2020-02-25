//
//  UIFont+Extension.swift
//  APITest
//
//  Created by Rajender on 25/02/20.
//  Copyright © 2020 Rajender. All rights reserved.
//

import Foundation
import UIKit


extension UIFont {
    static func defaultFont(with weight: UIFont.Weight, size: CGFloat) -> UIFont {
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
        let ration:CGFloat = 0.32
        switch weight {
        case UIFont.Weight.light:
            return UIFont(name: "Montserrat-Light", size: size*ration)!
        case UIFont.Weight.bold:
            return UIFont(name: "Montserrat-Bold", size: size*ration)!
        case UIFont.Weight.medium:
            return UIFont(name: "Montserrat-Medium", size: size*ration)!
        case UIFont.Weight.semibold:
            return UIFont(name: "Montserrat-SemiBold", size: size*ration)!
        case UIFont.Weight.regular:
            return UIFont(name: "Montserrat-Regular", size: size*ration)!
        default:
           return UIFont.systemFont(ofSize: size*ration, weight: weight)
        }
    }
}
