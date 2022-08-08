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
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    var body: some View {
        Image(serverImage.drawableRes)
            .renderingMode(serverImage.tint != nil ? .template: .original)
            .resizable()
            .serverModifier(serverView: serverImage, alignment: serverImage.alignment?.alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: nil, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
            .modifyIf(serverImage.tint != nil, transform: {
                $0.foregroundColor(Color(UIColor(withHex: serverImage.tint!)))
            })
    }
}
