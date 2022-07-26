//
//  SDWeightedContainer.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//

import SwiftUI

protocol SDWeightedContainer {
    var weightedContainer: ServerWeightedContainer { get }
    var weightDirection: WeightDirection { get }
    func calculateAvailableSpace(from size: CGFloat) -> CGFloat
}

extension SDWeightedContainer {
    func calculateAvailableSpace(from size: CGFloat) -> CGFloat {
        var adjustedSize = size
        if let spacing = weightedContainer.spacing, spacing > 0 { // Spacing being optional can cause bugs
            adjustedSize -= CGFloat(weightedContainer.items.count - 1) * spacing
        }
        
        switch(weightDirection) {
        case .vertical:
            if let paddingTop = weightedContainer.modifier?.paddingTop {
                adjustedSize -= paddingTop // Total height - top padding
            }
            if let paddingBottom = weightedContainer.modifier?.paddingBottom {
                adjustedSize -= paddingBottom // Total height - bottom padding
            }
        case .horizontal:
            if let paddingStart = weightedContainer.modifier?.paddingStart {
                adjustedSize -= paddingStart // Total width - start padding
            }
            if let paddingEnd = weightedContainer.modifier?.paddingEnd {
                adjustedSize -= paddingEnd // Total width - end padding
            }
        case .none:
            fatalError("Weights only supported on horizontal and vertical directions")
        }
        
        // Ignore negative values because they can cause layout errors
        // GeometryReader only calculates size for once but SingleAxisGeometryReader calculates it after every size change
        // We need to ignore paddings on first calculations, since they are small values they will create negative sizes
        // And raise errors, they can also crash the app
        return adjustedSize > 0 ? adjustedSize: size
    }
}
