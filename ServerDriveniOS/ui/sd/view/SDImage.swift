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
    var body: some View {
        Image(serverImage.drawableRes)
            .resizable()
            .modifyIf(serverImage.adaText != nil, transform: {
                $0.accessibilityLabel(serverImage.adaText!)
            })
            .serverModifier(serverModifier: serverImage.modifier)
    }
}
