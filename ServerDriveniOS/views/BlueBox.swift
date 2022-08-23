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
        SDContent(subviews: [blueBox()],parentWeightDirection: .none, parentSize: .zero, nestedInVerticalLayout: false, nestedInHorizontalLayout: false)
    }
}

func blueBox() -> ServerRow{
    return ServerRow(
        modifier: ServerModifier(spacingStart: 20, spacingEnd: 20),
        subviews: [
            ServerBox(
                modifier: ServerModifier(
                    weight: 1,
                    backgroundColor: "#002F8C",
                    cornerRadius: 16
                ),
                subviews: [
                    ServerColumn(
                        subviews: [
                            ServerRow(
                                alignment: ServerAlignment.END,
                                subviews: [
                                    ServerSpacer(),
                                    ServerImage(
                                        url: "MaskedCheck",
                                        modifier: ServerModifier(width: 192, height: 80)
                                    )
                                ]
                            ),
                            ServerText(
                                text: "Check-ins",
                                size: 28,
                                color: "#87C5FF",
                                weight: "700",
                                modifier: ServerModifier(
                                    spacingStart: 24,
                                    spacingEnd: 36
                                )
                            ),
                            ServerText(
                                text: "Create your first entry and let’s start connecting the dots for your health.",
                                size: 16,
                                color: "#FFFFFF",
                                weight: "500",
                                modifier: ServerModifier(
                                    spacingStart: 24,
                                    spacingEnd: 36,
                                    spacingTop: 22,
                                    spacingBottom: 27
                                )
                            ),
                            ServerText(
                                text: "YOU’VE GOT A HEAD START!",
                                size: 12,
                                color: "#FFFFFF",
                                weight: "700",
                                modifier: ServerModifier(
                                    spacingStart: 24,
                                    spacingEnd: 36,
                                    spacingBottom: 8
                                )
                            ),
                            ServerRow(
                                modifier: ServerModifier(
                                    spacingStart: 24,
                                    spacingEnd: 36,
                                    spacingBottom: 33
                                ),
                                subviews: [
                                    ServerImage(
                                        url: "Arrow_Right",
                                        modifier: ServerModifier(
                                            spacingEnd: 5,
                                            spacingTop: 5,
                                            width: 10,
                                            height: 5
                                        )
                                    ),
                                    ServerText(
                                        text: "Some of the data you record in journeys will appear here, too.",
                                        size: 12,
                                        color: "#FFFFFF",
                                        weight: "500"
                                    )
                                ]
                            )
                        ]
                    )
                ]
            )
        ]
    )
}
