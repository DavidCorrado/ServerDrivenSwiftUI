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
    var body: some View {
        let alignment: HorizontalAlignment = {
            if serverColumn.alignment == .END {
                return .trailing
            } else if serverColumn.alignment == .CENTER {
                return .center
            } else {
                return .leading
            }
        }()
        VStack(alignment: alignment, spacing: serverColumn.spacing ?? 0) {
            SDContent(items: serverColumn.items)
        }
        .size(serverModifier: serverColumn.modifier)
        .backgroundColor(serverModifier: serverColumn.modifier)
        .cornerRadius(serverModifier: serverColumn.modifier)
        .padding(serverModifier: serverColumn.modifier)
    }
}
