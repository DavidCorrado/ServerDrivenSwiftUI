//
//  SDColumn.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDColumn: View, SDWeightedContainer {
    var serverColumn: ServerColumn
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    
    var sizeAlignment: Alignment {
        if serverColumn.alignment == .END {
            return .topTrailing
        } else if serverColumn.alignment == .CENTER {
            return .top
        } else {
            return .topLeading
        }
    }
    
    var stackAlignment: HorizontalAlignment {
        if serverColumn.alignment == .END {
            return .trailing
        } else if serverColumn.alignment == .CENTER {
            return .center
        } else {
            return .leading
        }
    }
    
    var weightedContainer: ServerWeightedContainer {
        serverColumn
    }
    
    var body: some View {
        SingleAxisGeometryReader(axis: .vertical) { height in
            VStack(alignment: stackAlignment, spacing: serverColumn.spacing ?? 0) {
                SDContent(items: serverColumn.items, parentWeightDirection: serverColumn.weightDirection, parentSize: calculateAvailableSpace(from: height), parentTotalWeight: serverColumn.getTotalWeight(for: serverColumn.weightDirection))
            }
            .serverModifier(serverView: serverColumn, alignment: sizeAlignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight)
        }
    }
}


