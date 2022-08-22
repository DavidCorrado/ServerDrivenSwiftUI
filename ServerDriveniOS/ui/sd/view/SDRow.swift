//
//  SDRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDRow: View, SDWeightedContainer {
    var serverRow: ServerRow
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    var sizeAlignment: Alignment {
        if serverRow.alignment == .END {
            return .bottomLeading
        } else if serverRow.alignment == .CENTER {
            return .leading
        } else {
            return .topLeading
        }
    }
    
    var stackAlignment: VerticalAlignment {
        if serverRow.alignment == .END {
            return .bottom
        } else if serverRow.alignment == .CENTER {
            return .center
        } else {
            return .top
        }
    }
    
    var weightedContainer: ServerWeightedContainer {
        serverRow
    }
    
    var body: some View {
        SingleAxisGeometryReader(axis: .horizontal) { width in
            HStack(alignment: stackAlignment, spacing: serverRow.spacing ?? 0) {
                SDContent(subviews: serverRow.subviews, parentWeightDirection: serverRow.weightDirection, parentSize: calculateAvailableSpace(from: width), parentTotalWeight: serverRow.getTotalWeight(for: serverRow.weightDirection), nestedInVerticalLayout: false, nestedInHorizontalLayout: true)
            }
            .serverModifier(serverView: serverRow, alignment: sizeAlignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
        }
    }
}
