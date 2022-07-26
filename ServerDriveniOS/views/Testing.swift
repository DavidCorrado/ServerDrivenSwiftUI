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
        ServerRow(items: [
            ServerText(text: "Read Me"),
            ServerText(text: "Do Not Read", modifier: ServerModifier(adaText: "Read Me")),
            ServerText(text: "Read me Heading", isHeading: true),
            ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(
                width: 20,
                height: 20,
                adaText: "Disappointed"
            )),
            ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(width: 20, height: 20))
        ]),
        ServerRow(modifier: ServerModifier(adaText: "Read Me"), items: [
            ServerText(text: "Don't Read"),
            ServerText(text: "Don't Read", modifier: ServerModifier(adaText: "Don't Read"))
        ]),
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
            paddingStart: 30,
            paddingEnd: 30,
            paddingTop: 30,
            paddingBottom: 30,
            width: 200,
            height: 200
        ), items: [
            ServerColumn(items: [
                ServerText(text: "Card Padding HW"),
                ServerText(text: "Card 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ), alignment: .CENTER, items: [
            ServerText(text: "Col Center")
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), alignment: .END, items: [
            ServerText(text: "Col End")
        ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ), alignment: .CENTER, items: [
            ServerText(text: "Row Center")
        ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), alignment: .END, items: [
            ServerText(text: "Row End")
        ]),
        ServerRow(spacing: 20, modifier: ServerModifier(
            paddingStart: 30,
            paddingEnd: 30,
            paddingTop: 30,
            paddingBottom: 30,
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ),
        items: [
            ServerText(text: "Row Padding HW"),
            ServerText(text: "Row 2")
        ]),
        ServerColumn(spacing: 20, modifier: ServerModifier(
            paddingStart: 30,
            paddingEnd: 30,
            paddingTop: 30,
            paddingBottom: 30,
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ),
        items: [
            ServerText(text: "Col Padding HW"),
            ServerText(text: "Col 2")
        ]),
        ServerRow(modifier: ServerModifier(
            paddingStart: 30,
            paddingEnd: 30,
            paddingTop: 30,
            paddingBottom: 30,
            backgroundColor:"#ff0000",
            cornerRadius: 5
        ), items: [
            ServerText(text: "Row"),
            ServerColumn(modifier: ServerModifier(
                paddingStart: 30,
                paddingEnd: 30,
                paddingTop: 30,
                paddingBottom: 30,
                backgroundColor:"#00ff00",
                cornerRadius: 5
            ), items: [
                ServerText(text: "Col Padding HW"),
                ServerText(text: "Col 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), items: [
             ServerText(text: "Col Spacer"),
             ServerSpacer(),
             ServerText(text: "Col Spacer")
         ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor:"#ff0000",
            cornerRadius:5
        ), items: [
             ServerText(text: "Row Spacer"),
             ServerSpacer(),
             ServerText(text: "Row Spacer")
        ]),
        ServerRow(modifier: ServerModifier(
            paddingStart: 20,
            paddingEnd: 20,
            paddingTop: 20,
            paddingBottom: 20,
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), items: [
            ServerRow(modifier: ServerModifier(
                paddingStart: 20,
                paddingEnd: 20,
                paddingTop: 20,
                paddingBottom: 20,
                width: 200,
                height: 200,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), items: [
                ServerText(text: "Row Border Background")
            ])
        ]),
        ServerRow(modifier: ServerModifier(
            paddingStart: 20,
            paddingEnd: 20,
            paddingTop: 20,
            paddingBottom: 20,
            weight: 1, // we also need a weight here to fill horizontally, adding this doesn't break android
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), items: [
            ServerRow(modifier: ServerModifier(
                paddingStart: 20,
                paddingEnd: 20,
                paddingTop: 20,
                paddingBottom: 20,
                weight: 1,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), items: [
                ServerText(text: "Row Border Background")
            ])
        ]),
        ServerRow(modifier: ServerModifier(weight: 1), // we need the weight here to fill horizontally
            items: [
                ServerSpacer(modifier: ServerModifier(
                    height: 20, // we don't need a weight here because spacers on iOS take all space by default, tried on android it is also working same if we remove it and att it to ServerRow
                    backgroundColor: "#0000ff"
                ))
        ]),
        ServerRow(
            items: [
                ServerSpacer(),
                ServerSpacer(modifier: ServerModifier(
                    width: 50,
                    height: 20,
                    backgroundColor: "#0000ff"
                )),
                ServerSpacer()
        ]),
    ]
}
