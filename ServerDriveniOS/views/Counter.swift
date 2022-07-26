//
//  Counter.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import SwiftUI

struct Counters_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(items: counters(), parentDirection: .other, parentSize: .zero)
    }
}

func counters() -> [GenericIdentifiable] {
    return [ServerRow(spacing: 10, items: [
        counter(count: 27, label: "Active streak", image: "Streak"),
        counter(count: 451, label: "Total entries", image: "TotalEntries")
    ])]
}

func counter(count: Int, label: String, image: String) -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(backgroundColor: "#F5F5F5", cornerRadius: 16), items: [
        ServerText(text: String(count), size: 32, color: "#002F8C", weight: "300", modifier: ServerModifier(paddingStart: 18, paddingTop: 18)),
        ServerRow(modifier: ServerModifier(paddingStart: 18, paddingEnd: 14, paddingBottom: 14), alignment: .CENTER, items: [
            ServerText(text: label, size: 12, weight: "500"),
            ServerSpacer(),
            ServerImage(drawableRes: image,
                        modifier: ServerModifier(paddingStart: 8, width: 33,
                                                 height: 33))
        ])
    ])
}
