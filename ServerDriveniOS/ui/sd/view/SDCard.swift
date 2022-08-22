//
//  SDCard.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct SDCard: View, SDWeightedContainer {
    var serverCard: ServerCard
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool

    var weightedContainer: ServerWeightedContainer {
        serverCard
    }
    
    init(serverCard: ServerCard, parentWeightDirection: WeightDirection, parentSize: CGFloat, parentTotalWeight: CGFloat?, nestedInVerticalLayout: Bool, nestedInHorizontalLayout: Bool) {
        // Provide default values for backgroundColor and cornerRadius if they are empty
        // They can still be overriden by the server
        var serverCard = serverCard
        if serverCard.modifier?.backgroundColor == nil {
            serverCard.modifier?.backgroundColor = "#ffffff"
        }
        if serverCard.modifier?.cornerRadius == nil {
            serverCard.modifier?.cornerRadius = 16
        }
        self.serverCard = serverCard
        self.parentWeightDirection = parentWeightDirection
        self.parentSize = parentSize
        self.parentTotalWeight = parentTotalWeight
        self.nestedInHorizontalLayout = nestedInHorizontalLayout
        self.nestedInVerticalLayout = nestedInVerticalLayout
    }
    
    var body: some View {
        SingleAxisGeometryReader(axis: .vertical) { height in
            VStack(alignment: .leading, spacing: serverCard.spacing) {
                SDContent(subviews: serverCard.subviews, parentWeightDirection: serverCard.weightDirection, parentSize: calculateAvailableSpace(from: height), parentTotalWeight: serverCard.getTotalWeight(for: serverCard.weightDirection), nestedInVerticalLayout: true, nestedInHorizontalLayout: false)
            }
            .serverModifier(serverView: serverCard, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
            
        }.shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 15, x: 0, y: 5)

    }
}
