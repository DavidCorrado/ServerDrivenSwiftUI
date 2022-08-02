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
                width: 160, // Those are 200 on Android, but should be 200 - (20 0 2) = 160 on iOS
                height: 160,
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
        ServerRow(items: [
            ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(width: 20, height: 20)),
            ServerImage(drawableRes: "Disappointed", modifier: ServerModifier(paddingStart: 20, paddingEnd: 20, paddingTop: 20, paddingBottom: 20, width: 20, height: 20)) // This will be squished to zero since  we are adding 20 padding to 20x20 image because of the call order
        ]),
        ServerRow(modifier: ServerModifier(weight: 1),
            items: [
                ServerText(text: "Left 25", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
                ServerText(text: "Mid 50", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
                ServerText(text: "Right 25", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
        ]),
        ServerRow(items: [
            ServerRow(modifier: ServerModifier(width: 200), items: [
                ServerText(text: "Left 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
                ServerText(text: "Mid 50 is going to get really long", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
                ServerText(text: "Right 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
            ])
        ]),
        ServerCard(modifier: ServerModifier(
            paddingStart: 20,
            paddingEnd: 20,
            paddingTop: 20,
            paddingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 60
        ),items: [
            ServerText(text: "Card BG", modifier: ServerModifier(backgroundColor: "#ff0000"))
        ]),
        ServerRow(items: [
            ServerText(text: "Text is going to get really long.Left 30 is going to get really long", modifier: ServerModifier(backgroundColor: "#ff0000")),
            ServerText(text: "Text", modifier: ServerModifier(backgroundColor: "#00ff00"))
        ]),
        ServerRow(modifier: ServerModifier(weight: 1), // We need to define a weight here otherwise spacer will only fill the serverrow which has no weight
            items: [
            ServerSpacer(modifier: ServerModifier(
                paddingStart: 20, paddingEnd: 20, paddingTop: 20, paddingBottom: 20, weight: 1, backgroundColor: "#ff0000", cornerRadius: 20
            ))
        ]),
        ServerText(
            text: "Test",
            modifier: ServerModifier(
                paddingStart: 20,
                paddingEnd: 20,
                paddingTop: 20,
                paddingBottom: 20,
                backgroundColor: "#ff0000",
                cornerRadius: 60
            )
        ),
        ServerImage(drawableRes: "Running", tint: "#ff0000", modifier: ServerModifier(width: 20, height: 20)),
        ServerColumn(modifier: ServerModifier(weight: 1), items: [
            ServerBox(modifier: ServerModifier(weight: 1),items: [
                ServerRow(modifier: ServerModifier(weight: 1), items: [
                    ServerImage(drawableRes: "Background", contentScale: .FILL_HEIGHT, alignment: .TOP_END, modifier: ServerModifier(weight: 1, aspectRatio: 1.2))
                ]),
                ServerColumn(modifier: ServerModifier(weight: 1, aspectRatio: 1.2), // Normally aspectRatio modifier only works for images (also maybe shapes) on swiftui, I added manual calculations for it but it only runs if server view size is calculated manually (if view has a fixed height or fixed width or a weight)
                    items: [
                    ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000")),
                    ServerSpacer(),
                    ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000"))
                ])
            ])
        
        ]),
    ]
    
    
    
    /*
     
     ServerColumn(
         items = listOf(
             ServerBox(
                 items = listOf(
                     ServerRow(
                         items = listOf(
                             ServerImage(
                                 drawableRes = R.drawable.ic_background,
                                 alignment = ImageAlignment.TOP_END,
                                 modifier = ServerModifier(
                                     weight = 1f,
                                     aspectRatio = 1.2f
                                 ),
                                 contentScale = ImageContentScale.FILL_HEIGHT
                             )
                         )
                     ),
                     ServerColumn(
                         items = listOf(
                             ServerText(
                                 text = "Overlay",
                                 modifier = ServerModifier(backgroundColor = "#FF0000")
                             ),
                             ServerSpacer(),
                             ServerText(
                                 text = "Overlay",
                                 modifier = ServerModifier(backgroundColor = "#FF0000")
                             ),
                         ),
                         modifier = ServerModifier(
                             weight = 1f,
                             aspectRatio = 1.2f
                         ),
                     )

                 )
             ),
         )
     )
     
     
     */
    
    
}
