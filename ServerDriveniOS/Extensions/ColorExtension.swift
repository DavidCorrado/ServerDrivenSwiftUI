//
//  ColorExtension.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/8/22.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(withHex: String, alpha: CGFloat = 1.0) {
        var hexString = withHex
        if hexString.isEmpty {
            hexString = "F5F5F5"
        }
        
        var cString: String = hexString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        
        // Default to white on bad data
        if cString.count != 6 {
            hexString = "F5F5F5"
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
