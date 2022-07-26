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
    var parentDirection: ParentDirection
    var parentSize: CGSize
    init(serverCard: ServerCard, parentDirection: ParentDirection, parentSize: CGSize) {
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
        self.parentDirection = parentDirection
        self.parentSize = parentSize
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading) {
                SDContent(items: serverCard.items, parentDirection: .vertical, parentSize: geo.size)
            }
        }
        .serverModifier(serverModifier: serverCard.modifier, parentDirection: parentDirection, parentSize: parentSize)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 15, x: 0, y: 5)
    }
}
