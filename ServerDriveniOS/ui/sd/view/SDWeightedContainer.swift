//
//  SDWeightedContainer.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//

import SwiftUI

protocol SDWeightedContainer {
    var weightedContainer: ServerWeightedContainer { get }
    func calculateAvailableSpace(from size: CGFloat) -> CGFloat
}

extension SDWeightedContainer {
    func calculateAvailableSpace(from size: CGFloat) -> CGFloat {
        var adjustedSize = size
        if let spacing = weightedContainer.spacing, spacing > 0 { // Spacing being optional can cause bugs
            adjustedSize -= CGFloat(weightedContainer.items.count - 1) * spacing
        }
        
        switch(weightedContainer.weightDirection) {
        case .vertical:
            if let paddingTop = weightedContainer.modifier?.spacingTop {
                adjustedSize -= paddingTop // Total height - top padding
            }
            if let paddingBottom = weightedContainer.modifier?.spacingBottom {
                adjustedSize -= paddingBottom // Total height - bottom padding
            }
        case .horizontal:
            if let paddingStart = weightedContainer.modifier?.spacingStart {
                adjustedSize -= paddingStart // Total width - start padding
            }
            if let paddingEnd = weightedContainer.modifier?.spacingEnd {
                adjustedSize -= paddingEnd // Total width - end padding
            }
        case .none:
            fatalError("Weights only supported on horizontal and vertical directions")
        }
        
        for view in weightedContainer.items {
            if weightedContainer.weightDirection == .vertical, let itemHeight = view.modifier?.height {
                adjustedSize -= itemHeight
            } else if weightedContainer.weightDirection == .horizontal, let itemWidth = view.modifier?.width {
                adjustedSize -= itemWidth
            }
        }
        
        // Ignore negative values because they can cause layout errors
        // GeometryReader only calculates size for once but SingleAxisGeometryReader calculates it after every size change
        // We need to ignore paddings on first calculations, since they are small values they will create negative sizes
        // And raise errors, they can also crash the app
        return adjustedSize > 0 ? adjustedSize: size
    }
}
