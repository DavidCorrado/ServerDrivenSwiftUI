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
        SDContent(items: [ServerColumn(items: [history1(), history2()])], parentWeightDirection: .other, parentSize: .zero)
    }
}

func history1() -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 16, paddingBottom: 16), items: [
        ServerRow(alignment: .CENTER, items: [
            ServerColumn(items: [
                ServerRow(alignment: .CENTER, items: [
                    ServerText(text: "45m", size: 18, weight: "500"),
                    ServerSpacer(),
                    ServerText(text: "Nov 1", size: 12, weight: "500")
                ]),
                ServerRow(modifier: ServerModifier(paddingTop: 4), alignment: .CENTER, items: [
                    ServerImage(drawableRes: "Running", modifier: ServerModifier(paddingEnd: 8, width: 14, height: 14)),
                    ServerText(text: "Bubble TBD", modifier: ServerModifier(paddingEnd: 8)),
                    ServerText(text: "Jogging or running", size: 12, weight: "500"),
                    ServerSpacer(),
                    ServerText(text: "10:45 AM", size: 12, weight: "700")

                ])
            ]),
            ServerImage(drawableRes: "Chevron", modifier: ServerModifier(paddingStart: 36, width: 5, height: 11))
        ])
    ])
}

func history2() -> ServerColumn {
    return ServerColumn(modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 16, paddingBottom: 16), items: [
        ServerRow(alignment: .CENTER, items: [
            ServerRow(alignment: .CENTER, items: [
                ServerRow(alignment: .CENTER, items: [
                    ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(paddingEnd: 10, width: 24, height: 22)),
                    ServerText(text: "Disappointed", weight: "500")
                ]),
                ServerSpacer(),
                ServerColumn(alignment: .END, items: [
                    ServerText(text: "Nov 1", size: 12, weight: "500", modifier: ServerModifier(paddingBottom: 8)),
                    ServerText(text: "10: 45 AM", size: 12, weight: "700")
                ])
            ]),
            ServerImage(drawableRes: "Chevron", modifier: ServerModifier(paddingStart: 36, width: 5, height: 11))
        ])
    ])
}
