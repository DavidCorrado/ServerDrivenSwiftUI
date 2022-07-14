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
        SDContent(items: [entry()])
    }
}

func entry() -> ServerCard {
    return ServerCard(items: [
        ServerColumn(modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 24, paddingBottom: 24), items: [
            ServerRow(alignment: .CENTER, items: [
                ServerImage(drawableRes: "BP", modifier: ServerModifier(paddingEnd: 7, width: 18, height: 18)), ServerText(text: "Blood Pressure", size: 14, weight: "500"),
                ServerSpacer(),
                ServerText(text: "Nov 1 ", size: 12, weight: "600"),
                ServerText(text: "8:31", size: 12, weight: "700")
            ]),
            ServerText(text: "123/82", size: 36, color: "#002F8C", weight: "300", modifier: ServerModifier(paddingTop: 21, paddingBottom: 15)),
            ServerRow(alignment: .CENTER, items: [
                ServerImage(drawableRes: "Running", modifier: ServerModifier(paddingEnd: 8, width: 20, height: 20)),
                ServerText(text: "Bubble TBD", modifier: ServerModifier(paddingEnd: 8)),
                ServerText(text: "Per AHA guidelines", size: 12, weight: "500")
            ])
        ])
    ]
    )
}
