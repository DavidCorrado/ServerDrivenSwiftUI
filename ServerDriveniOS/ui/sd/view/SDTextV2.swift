//
//  SDTextV2.swift
//  ServerDriveniOS
//
//  Created by mustafa.alkan on 2.11.2022.
//

import Foundation
import SwiftUI

struct SDTextV2: View {
    var serverText: ServerTextV2
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.legibilityWeight) var legibilityWeight
    
    var body: some View {
        if #available(iOS 15, *) {
            Text(serverText.getAttributedString())
                .modifyIf(serverText.isHeading ?? false, transform: {
                    $0.accessibilityAddTraits(.isHeader)
                })
                .multilineTextAlignment(serverText.textAlignment?.alignment ?? .leading)
                .serverModifier(serverView: serverText, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
        } else {
           getText().modifyIf(serverText.isHeading ?? false, transform: {
                $0.accessibilityAddTraits(.isHeader)
            }).multilineTextAlignment(serverText.textAlignment?.alignment ?? .leading).serverModifier(serverView: serverText, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: parentTotalWeight, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
        }
    }
    
    func getText()->Text{
        var output = Text("")
        serverText.styledTexts.forEach { styledText in
           
            let newText = Text(styledText.text)
            output = output + newText.foregroundColor(Color(UIColor(withHex: styledText.color ?? "#4C5870")))
                .fontWeight(styledText.fontWeight())
                .font(.system(size: UIFontMetrics.default.scaledValue(for: CGFloat(styledText.fontSize()))))
        }
         
        return output
        
    }
}



