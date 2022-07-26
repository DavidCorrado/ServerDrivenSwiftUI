//
//  SDCard.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct SDCard: View {
    var serverCard: ServerCard
    var parentWeightDirection: ParentWeightDirection
    var parentSize: CGFloat
    var parentModifier: ServerModifier?
    init(serverCard: ServerCard, parentWeightDirection: ParentWeightDirection, parentSize: CGFloat, parentModifier: ServerModifier?) {
        // Provide default values for backgroundColor and cornerRadius if they are empty
        // They can still be overriden by the server
        var serverCard = serverCard
        if serverCard.modifier?.backgroundColor == nil {
            serverCard.modifier?.backgroundColor = "#ffffff"
        }
        if serverCard.modifier?.cornerRadius == nil {
            serverCard.modifier?.cornerRadius = 16
        }
        self.serverCard = serverCard
        self.parentWeightDirection = parentWeightDirection
        self.parentSize = parentSize
        self.parentModifier = parentModifier
    }
    
    var body: some View {
        SingleAxisGeometryReader(axis: .vertical) { height in
            VStack(alignment: .leading) {
                SDContent(items: serverCard.items, parentWeightDirection: .vertical, parentSize: height, parentModifier: serverCard.modifier)
            }
            .serverModifier(serverModifier: serverCard.modifier, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 15, x: 0, y: 5)
        }

    }
}
