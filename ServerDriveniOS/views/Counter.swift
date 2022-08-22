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
        SDContent(subviews: counters(), parentWeightDirection: .none, parentSize: .zero, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
    }
}

func counters() -> [ServerView] {
    return [ServerRow(spacing: 10, subviews: [
        counter(count: 27, label: "Active streak", image: "Streak"),
        counter(count: 451, label: "Total entries", image: "TotalEntries")
    ])]
}

func counter(count: Int, label: String, image: String) -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(backgroundColor: "#F5F5F5", cornerRadius: 16), subviews: [
        ServerText(text: String(count), size: 32, color: "#002F8C", weight: "300", modifier: ServerModifier(spacingStart: 18, spacingTop: 18)),
        ServerRow(modifier: ServerModifier(spacingStart: 18, spacingEnd: 14, spacingBottom: 14), alignment: .CENTER, subviews: [
            ServerText(text: label, size: 12, weight: "500"),
            ServerSpacer(),
            ServerImage(drawableRes: image,
                        modifier: ServerModifier(spacingStart: 8, width: 33,
                                                 height: 33))
        ])
    ])
}
