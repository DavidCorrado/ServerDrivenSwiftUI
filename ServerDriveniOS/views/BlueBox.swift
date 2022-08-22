//
//  BlueBox.swift
//  ServerDriveniOS
//
//  Created by Mustafa ismail ALKAN on 11.08.2022.
//

import Foundation
import SwiftUI

struct BlueBox_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(items: [blueBox()],parentWeightDirection: .none, parentSize: .zero, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
    }
}


func blueBox() -> ServerBox{
    return ServerBox(
        modifier: ServerModifier(backgroundColor: "#002F8C", cornerRadius: 16),
        items: [
            ServerColumn(
                modifier: ServerModifier(
                    spacingStart: 24,
                    spacingEnd: 36,
                    spacingTop: 61,
                    spacingBottom: 33
                ),
                items: [
                    ServerText(text: "Introducing", size: 14, color: "#FFFFFF", weight: "600" ),
                    ServerText(text: "Check-ins", size: 28, color: "#87C5FF", weight: "700"),
                    ServerSpacer(modifier: ServerModifier(height: 22)),
                    ServerText(text: "Create your first entry and let’s start connecting the dots for your health.", size: 16,color: "#FFFFFF", weight: "500" ),
                    ServerSpacer(modifier: ServerModifier(height: 27)),
                    ServerRow(
                        items: [
                            ServerImage(
                                drawableRes: "Arrow_Right",
                                modifier: ServerModifier(spacingEnd: 5, spacingTop: 5, width: 10, height: 6 )
                            ),
                            ServerText(text: "Some of the data you record in journeys will appear here, too.", size: 12, color: "#FFFFFF", weight: "500")
                        ]
                    )
                ]
            ),
        ]
    )
}
