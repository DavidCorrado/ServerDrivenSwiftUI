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
    var body: some View {
        Text(serverText.text)
            .fontWeight(serverText.fontWeight())
            .font(.system(size: CGFloat(serverText.size ?? 16)))
            .modifyIf(serverText.decoration.contains(DecorationType.STRIKETHROUGH), transform: {
                $0.strikethrough(true)
            })
            .modifyIf(serverText.isHeading ?? false, transform: {
                        $0.accessibilityAddTraits(.isHeader)
                    })
            .serverModifier(serverModifier: serverText.modifier)
           

    }
}
