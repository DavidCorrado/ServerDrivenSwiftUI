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
                Text(item.text)
            case let item as ServerColumn:
                SDColumn(items: item.items)
            case _ as ServerSpacer:
                SDSpacer()
            case let item as ServerRow:
                SDRow(items: item.items)
            default:
                Text("Not View Found")
            }
        }
    }
}

