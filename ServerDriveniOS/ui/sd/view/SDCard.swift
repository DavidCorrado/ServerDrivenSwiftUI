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
    
    init(serverCard: ServerCard) {
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
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            SDContent(items: serverCard.items)
        }
        .serverModifier(serverModifier: serverCard.modifier)
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.08)), radius: 15, x: 0, y: 5)
    }
}
