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
        ZStack(alignment: .topLeading) { // Should this be top leading as hardcoded?
            SDContent(items: serverBox.items, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
                .serverModifier(serverView: serverBox, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
        }
    }
}
