//
//  ServerBox.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 28.07.2022.
//

import Foundation
import SwiftUI

struct SDBox: View {
    var serverBox: ServerBox
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat

    var body: some View {
        ZStack {
            SDContent(items: serverBox.items, parentWeightDirection: .none, parentSize: .zero)
                .serverModifier(serverModifier: serverBox.modifier, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
        }
    }
}
