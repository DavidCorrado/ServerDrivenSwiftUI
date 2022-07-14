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
    var body: some View {
        let alignment: VerticalAlignment = {
            if serverRow.alignment == .END {
                return .bottom
            } else if serverRow.alignment == .CENTER {
                return .center
            } else {
                return .top
            }
        }()
        HStack(alignment: alignment, spacing: serverRow.spacing ?? 0) {
            SDContent(items: serverRow.items)
        }
        .size(serverModifier: serverRow.modifier)
        .padding(serverModifier: serverRow.modifier)
    }
}
