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
    var body: some View {
        ForEach(items, id: \.id) { item in
            switch item {
            case let item as ServerText:
                SDText(serverText: item)
            case let item as ServerColumn:
                SDColumn(serverColumn: item)
            case _ as ServerSpacer:
                SDSpacer()
            case let item as ServerRow:
                SDRow(serverRow: item)
            case let item as ServerImage:
                SDImage(serverImage: item)
            case let item as ServerCard:
                SDCard(serverCard: item)
            default:
                Text("Not View Found")
            }
        }
    }
}

