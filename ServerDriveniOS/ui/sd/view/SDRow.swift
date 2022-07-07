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
        HStack(spacing: 0) {
            SDContent(items: serverRow.items)
        }.serverModifier(serverModifier: serverRow.modifier)
    }
}
