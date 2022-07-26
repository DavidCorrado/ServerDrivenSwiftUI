//
//  SDImage.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct SDImage: View {
    var serverImage: ServerImage
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var body: some View {
        Image(serverImage.drawableRes)
            .resizable()
            .serverModifier(serverModifier: serverImage.modifier, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
    }
}
