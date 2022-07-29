//
//  ServerModifer.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import UIKit

struct ServerModifier {
    var paddingStart: CGFloat?
    var paddingEnd: CGFloat?
    var paddingTop: CGFloat?
    var paddingBottom: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var weight: CGFloat?
    var backgroundColor: String?
    var cornerRadius: Float?
    var adaText: String?
    var aspectRatio: Float?
    
    var wrappedAspectRatio: CGSize? {
        guard let aspectRatio = aspectRatio else {
            return nil
        }
        
        return CGSize(width: Int(aspectRatio * 1000), height: 1000)
    }
}
