//
//  ServerRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import UIKit

struct ServerRow: ServerView, ServerWeightedContainer {
    var type: ServerItemType = .ROW
    var id = UUID()
    var spacing: CGFloat?
    var modifier: ServerModifier?
    var alignment: ServerAlignment?
    var items: [ServerView]
    
    var weightDirection: WeightDirection {
        .horizontal
    }
}
