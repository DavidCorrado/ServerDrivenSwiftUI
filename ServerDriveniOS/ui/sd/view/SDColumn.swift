//
//  SDColumn.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDColumn: View {
    var serverColumn: ServerColumn
    
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
    
    var body: some View {
        VStack(alignment: stackAlignment, spacing: serverColumn.spacing ?? 0) {
            SDContent(items: serverColumn.items)
        }
        .serverModifier(serverModifier: serverColumn.modifier, alignment: sizeAlignment)
    }
}
