//
//  ServerColumn.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import UIKit

struct ServerColumn: ServerView, ServerWeightedContainer {
    var type: ServerItemType = .COLUMN
    var id = UUID()
    var spacing: CGFloat?
    var modifier: ServerModifier?
    var alignment: ServerAlignment?
    var subviews: [ServerView]
    
    var weightDirection: WeightDirection {
        .vertical
    }
}
