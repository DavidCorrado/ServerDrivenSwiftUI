//
//  ServerCard.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import SwiftUI

struct ServerCard: ServerView, ServerWeightedContainer {
    var type: ServerItemType = .CARD
    var id = UUID()
    var modifier: ServerModifier?
    var subviews: [ServerView]
    
    var spacing: CGFloat? {
        0
    }
    
    var weightDirection: WeightDirection {
        .vertical
    }
}
