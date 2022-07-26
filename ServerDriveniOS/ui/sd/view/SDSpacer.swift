//
//  SDSpacer.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation
import SwiftUI

struct SDSpacer: View {
    var serverSpacer: ServerSpacer
    var parentWeightDirection: WeightDirection
    var parentSize: CGFloat
    
    var body: some View {
        Spacer()
            .serverModifier(serverModifier: serverSpacer.modifier, parentWeightDirection: parentWeightDirection, parentSize: parentSize)
    }
}
