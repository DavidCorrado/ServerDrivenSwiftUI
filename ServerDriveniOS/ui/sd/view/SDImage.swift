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
        Image(serverImage.url)
            .renderingMode(serverImage.tint != nil ? .template: .original)
            .resizable()
            .modifyIf(serverImage.contentScale == .FIT, transform: {
                $0.scaledToFit()
            })
            .modifyIf(serverImage.contentScale  == .CROP, transform: {
                $0.scaledToFill()
            })
            .modifyIf(serverImage.contentScale  == .FILL_HEIGHT, transform: {
                $0.scaledToFit()
                    .fixedSize(horizontal: true, vertical: false)
            })
            .modifyIf(serverImage.contentScale  == .FILL_WIDTH, transform: {
                $0.scaledToFit()
                    .fixedSize(horizontal: false, vertical: true)
            })
            .serverModifier(serverView: serverImage, alignment: serverImage.alignment?.alignment, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: nil, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
            .modifyIf(serverImage.tint != nil, transform: {
                $0.foregroundColor(Color(UIColor(withHex: serverImage.tint!)))
            })
            .clipped()
    }
}
