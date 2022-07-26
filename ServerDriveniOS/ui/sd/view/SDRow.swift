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
    var parentDirection: ParentDirection
    var parentSize: CGSize
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
        GeometryReader { geo in
            HStack(alignment: stackAlignment, spacing: serverRow.spacing ?? 0) {
                SDContent(items: serverRow.items, parentDirection: .horizontal, parentSize: geo.size)
            }
        }
        .serverModifier(serverModifier: serverRow.modifier, alignment: sizeAlignment, parentDirection: parentDirection, parentSize: parentSize)
    }
}
