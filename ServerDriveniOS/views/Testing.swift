//
//  Testing.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/11/22.
//

import Foundation
import SwiftUI
 struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .trailing) {
                    Text("Test").frame(width: 200, height: 200, alignment: .trailing)
                }.background(Color.red).cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
        }
    }
 }

// struct Testing2_Previews: PreviewProvider {
//    static var previews: some View {
//        SDContent(items: testing())
//    }
// }
//
func testing() -> [GenericIdentifiable] {
    return [
        ServerCard(items: [
            ServerText(text: "Card")
        ]),
        ServerCard(modifier: ServerModifier(
            paddingStart: 30,
            paddingEnd: 30,
            paddingTop: 30,
            paddingBottom: 30
        ), items: [
            ServerText(text: "Card Padding")
        ]),
        ServerCard(modifier: ServerModifier(
            paddingStart: 30, paddingEnd: 30, paddingTop: 30, paddingBottom: 30, width: 200, height: 200
        ), items: [
            ServerColumn(items: [
                ServerText(text: "Card Padding HW"),
                ServerText(text: "Card 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(width: 200, height: 200), alignment: .CENTER, items: [
            ServerText(text: "Col Center")
        ]),
        ServerColumn(modifier: ServerModifier(width: 200, height: 200), alignment: .END, items: [
            ServerText(text: "Col End")
        ]),
        ServerRow(modifier: ServerModifier(width: 200, height: 200), alignment: .CENTER, items: [
            ServerText(text: "Row Center")
        ]),
        ServerRow(modifier: ServerModifier(width: 200, height: 200), alignment: .CENTER, items: [
            ServerText(text: "Row End")
        ]),
        ServerRow(spacing: 20, modifier: ServerModifier(
            paddingStart: 30, paddingEnd: 30, paddingTop: 30, paddingBottom: 30, width: 200, height: 200
        ),
        items: [
            ServerText(text: "Row Padding HW"),
            ServerText(text: "Row 2")
        ]),
        ServerColumn(spacing: 20, modifier: ServerModifier(
            paddingStart: 30, paddingEnd: 30, paddingTop: 30, paddingBottom: 30, width: 200, height: 200
        ),
        items: [
            ServerText(text: "Col Padding HW"),
            ServerText(text: "Col 2")
        ]),
        ServerRow(modifier: ServerModifier(
            paddingStart: 30, paddingEnd: 30, paddingTop: 30, paddingBottom: 30
        ), items: [
            ServerText(text: "Row"),
            ServerColumn(modifier: ServerModifier(
                paddingStart: 30, paddingEnd: 30, paddingTop: 30, paddingBottom: 30
            ), items: [
                ServerText(text: "Col Padding HW"),
                ServerText(text: "Col 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(width: 200, height: 200),
                     items: [
                         ServerText(text: "Col Spacer"),
                         ServerSpacer(),
                         ServerText(text: "Col Spacer")
                     ]),
        ServerRow(modifier: ServerModifier(width: 200, height: 200),
                     items: [
                         ServerText(text: "Row Spacer"),
                         ServerSpacer(),
                         ServerText(text: "Row Spacer")
                     ])
    ]
}
