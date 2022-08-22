//
//  History.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/8/22.
//

import Foundation
import SwiftUI

struct History_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(subviews: [ServerColumn(subviews: [history1(), history2()])], parentWeightDirection: .none, parentSize: .zero, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
    }
}

func history1() -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(spacingStart: 20, spacingEnd: 20, spacingTop: 16, spacingBottom: 16), subviews: [
        ServerRow(alignment: .CENTER, subviews: [
            ServerColumn(subviews: [
                ServerRow(alignment: .CENTER, subviews: [
                    ServerText(text: "45m", size: 18, weight: "500"),
                    ServerSpacer(),
                    ServerText(text: "Nov 1", size: 12, weight: "500")
                ]),
                ServerRow(modifier: ServerModifier(spacingTop: 4), alignment: .CENTER, subviews: [
                    ServerImage(drawableRes: "Running", modifier: ServerModifier(spacingEnd: 8, width: 14, height: 14)),
                    ServerText(text: "Bubble TBD", modifier: ServerModifier(spacingEnd: 8)),
                    ServerText(text: "Jogging or running", size: 12, weight: "500"),
                    ServerSpacer(),
                    ServerText(text: "10:45 AM", size: 12, weight: "700")

                ])
            ]),
            ServerImage(drawableRes: "Chevron", modifier: ServerModifier(spacingStart: 36, width: 5, height: 11))
        ])
    ])
}

func history2() -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(spacingStart: 20, spacingEnd: 20, spacingTop: 16, spacingBottom: 16), subviews: [
        ServerRow(alignment: .CENTER, subviews: [
            ServerRow(alignment: .CENTER, subviews: [
                ServerRow(alignment: .CENTER, subviews: [
                    ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(spacingEnd: 10, width: 24, height: 22)),
                    ServerText(text: "Disappointed", weight: "500")
                ]),
                ServerSpacer(),
                ServerColumn(alignment: .END, subviews: [
                    ServerText(text: "Nov 1", size: 12, weight: "500", modifier: ServerModifier(spacingBottom: 8)),
                    ServerText(text: "10: 45 AM", size: 12, weight: "700")
                ])
            ]),
            ServerImage(drawableRes: "Chevron", modifier: ServerModifier(spacingStart: 36, width: 5, height: 11))
        ])
    ])
}
