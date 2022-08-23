//
//  Bubble.swift
//  ServerDriveniOS
//
//  Created by mustafa.alkan on 23.08.2022.
//

import Foundation
import SwiftUI

struct Bubble_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(
            subviews: [
                ServerColumn(
                    spacing:20,
                    subviews: [generateBubble(),generateBubbleWithImage()]
                )
            ],
            parentWeightDirection: .none,
            parentSize: .zero,
            nestedInVerticalLayout: false,
            nestedInHorizontalLayout: false
        )
    }
}

func generateBubble()-> ServerRow {
    return ServerRow(
        modifier: ServerModifier(backgroundColor: "#70DEB0", cornerRadius: 6),
        subviews: [
            ServerText(
                text: "NORMAL", size: 12, color: "#094E44",
                weight: "700",
                modifier: ServerModifier(
                    spacingStart: 8,
                    spacingEnd: 8,
                    spacingTop: 6,
                    spacingBottom: 6
                )
            )
        ]
    )
}

func generateBubbleWithImage() -> ServerRow {
    return ServerRow(
        modifier: ServerModifier(backgroundColor: "#70DEB0", cornerRadius: 6),
        alignment: ServerAlignment.CENTER,
        subviews: [
            ServerImage(
                url: "Barbell",
                modifier: ServerModifier(spacingStart: 8, width: 16, height: 16)
            ),
            ServerText(
                text: "NORMAL",
                size: 12,
                color: "#094E44",
                weight: "700",
                modifier: ServerModifier(
                    spacingStart: 6,
                    spacingEnd: 8,
                    spacingTop: 6,
                    spacingBottom: 6
                )
            )
        ]
    )
}
