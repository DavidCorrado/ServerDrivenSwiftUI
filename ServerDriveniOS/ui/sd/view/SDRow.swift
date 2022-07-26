//
//  SDRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDRow: View {
    var serverRow: ServerRow
    var parentWeightDirection: ParentWeightDirection
    var parentSize: CGFloat
    var parentModifier: ServerModifier?
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
    
    var body: some View {
        SingleAxisGeometryReader(axis: .horizontal) { width in
            HStack(alignment: stackAlignment, spacing: serverRow.spacing ?? 0) {
                SDContent(items: serverRow.items, parentWeightDirection: .horizontal, parentSize: width, parentModifier: serverRow.modifier)
            }
            .serverModifier(serverModifier: serverRow.modifier, alignment: sizeAlignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
        }
        
    }
}
