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
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool

    var body: some View {
        ZStack(alignment: .topLeading) { // Should this be top leading as hardcoded?
            SDContent(items: serverBox.items, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: serverBox.getTotalWeight(for: parentWeightDirection), nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
                .serverModifier(serverView: serverBox, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
        }
    }
}
