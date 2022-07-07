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
    var body: some View {
        VStack(alignment: .leading) {
            SDContent(items: serverCard.items)
        }.serverModifier(serverModifier: serverCard.modifier).cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            )
    }
}
