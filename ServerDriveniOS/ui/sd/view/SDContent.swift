//
//  SDContent.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/1/22.
//

import Foundation
import SwiftUI

struct SDContent: View {
    var items: [GenericIdentifiable]
    var parentWeightDirection: ParentWeightDirection
    var parentSize: CGFloat
    var parentModifier: ServerModifier?
    var body: some View {
        ForEach(items, id: \.id) { item in
            switch item {
            case let item as ServerText:
                SDText(serverText: item, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            case let item as ServerColumn:
                SDColumn(serverColumn: item, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            case _ as ServerSpacer:
                SDSpacer()
            case let item as ServerRow:
                SDRow(serverRow: item, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            case let item as ServerImage:
                SDImage(serverImage: item, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            case let item as ServerCard:
                SDCard(serverCard: item, parentWeightDirection: parentWeightDirection, parentSize: parentSize, parentModifier: parentModifier)
            default:
                Text("Not View Found")
            }
        }
    }
}
