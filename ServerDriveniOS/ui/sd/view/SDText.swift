//
//  SDText.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct SDText: View {
    var serverText: ServerText
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    var body: some View {
        Text(serverText.text)
            .foregroundColor(Color(UIColor(withHex: serverText.color ?? "#4C5870")))
            .fontWeight(serverText.fontWeight())
            .font(.system(size: CGFloat(serverText.size ?? 16)))
            .modifyIf(serverText.decoration.contains(.STRIKETHROUGH), transform: {
                $0.strikethrough(true)
            })
            .modifyIf(serverText.style == .ITALIC, transform: {
                ($0 as? Text)?.italic()
            })
            .modifyIf(serverText.isHeading ?? false, transform: {
                $0.accessibilityAddTraits(.isHeader)
            })
            .serverModifier(serverView: serverText, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight)
    }
}
