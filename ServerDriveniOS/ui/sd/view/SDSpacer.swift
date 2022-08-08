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
    var parentTotalWeight: CGFloat?
    var nestedInVerticalLayout: Bool
    var nestedInHorizontalLayout: Bool
    
    var body: some View {
        Spacer(minLength: 0)
            .serverModifier(serverView: serverSpacer, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentTotalWeight: nil, nestedInVerticalLayout: nestedInVerticalLayout, nestedInHorizontalLayout: nestedInHorizontalLayout)
    }
}
