//
//  ServerCard.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import SwiftUI

struct ServerCard: GenericIdentifiable, ServerWeightedContainer {
    var type: ServerItemType = .CARD
    var id = UUID()
    var modifier: ServerModifier?
    var items: [GenericIdentifiable]
    
    var spacing: CGFloat? {
        0
    }
}
