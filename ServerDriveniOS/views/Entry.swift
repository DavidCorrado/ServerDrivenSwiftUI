//
//  Entry.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/7/22.
//

import Foundation
import SwiftUI

struct Entry_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(subviews: [entry()], parentWeightDirection: .none, parentSize: .zero, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
    }
}

func entry() -> ServerCard {
    return ServerCard(subviews: [
        ServerColumn(modifier: ServerModifier(spacingStart: 20, spacingEnd: 20, spacingTop: 24, spacingBottom: 24), subviews: [
            ServerRow(alignment: .CENTER, subviews: [
                ServerImage(drawableRes: "BP", modifier: ServerModifier(spacingEnd: 7, width: 18, height: 18)), ServerText(text: "Blood Pressure", size: 14, weight: "500"),
                ServerSpacer(),
                ServerText(text: "Nov 1 ", size: 12, weight: "600"),
                ServerText(text: "8:31", size: 12, weight: "700")
            ]),
            ServerText(text: "123/82", size: 36, color: "#002F8C", weight: "300", modifier: ServerModifier(spacingTop: 21, spacingBottom: 15)),
            ServerRow(alignment: .CENTER, subviews: [
                ServerImage(drawableRes: "Running", modifier: ServerModifier(spacingEnd: 8, width: 20, height: 20)),
                ServerText(text: "Bubble TBD", modifier: ServerModifier(spacingEnd: 8)),
                ServerText(text: "Per AHA guidelines", size: 12, weight: "500")
            ])
        ])
    ]
    )
}
