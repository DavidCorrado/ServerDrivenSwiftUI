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

func testing() -> [ServerView] {
    return [
        ServerRow(modifier: ServerModifier(spacingStart:20,spacingEnd: 20),
            subviews : [
                ServerCard(modifier: ServerModifier(spacingStart:20,spacingEnd: 20,spacingTop: 20,spacingBottom: 20,weight: 1),
                    subviews: [
                        ServerRow(alignment: ServerAlignment.CENTER,
                            subviews: [
                                ServerTextV2(modifier: ServerModifier(weight: 1),textAlignment: ServerTextAlignment.CENTER,
                                             styledTexts: [
                                                ServerStyledText(text: "This text has a weight 900\n", size: 14, color: "#4C5870", weight: "900"),
                                                ServerStyledText(text: "This text has a red color and background is black text size is 16\n", size: 16, color: "#FF0000", backgroundColor: "#000000", weight: "400"),
                                                ServerStyledText(text: "This is italic\n", size: 14, style: FontType.ITALIC, color: "#4C5870", weight: "400"),
                                                ServerStyledText(text: "This is also italic but bolder pinker and bigger\n", size: 16, style: FontType.ITALIC, color: "#FF0070", weight: "900"),
                                                ServerStyledText(text: "Im UNDERLINE", size: 16, color: "#4C5870", decoration: [DecorationType.UNDERLINE], weight: "500"),
                                                ServerStyledText(text: " and ", size: 10, color: "#4C5870", weight: "500"),
                                                ServerStyledText(text: "Im STRIKETHROUGH ", size: 16, color: "#4C5870", decoration: [DecorationType.STRIKETHROUGH], weight: "500"),
                                                ServerStyledText(text: "\n\nIm havin all", size: 24, style: FontType.ITALIC, color: "#00FF00", backgroundColor: "#0000FF", decoration: [DecorationType.STRIKETHROUGH,DecorationType.UNDERLINE], weight: "700"),
                                                ServerStyledText(text: "\n\n\nAll the new lines are made by \\n", size: 10, color: "#4C5870", weight: "400")
                                    ]
                                )
                            ]
                        )
                    ]
                )
                
            ]
        ),
        ServerSpacer(modifier: ServerModifier(height: 20)),
        ServerRow(modifier: ServerModifier(spacingStart:20,spacingEnd: 20),
            subviews : [
                ServerCard(modifier: ServerModifier(spacingStart:20,spacingEnd: 20,spacingTop: 20,spacingBottom: 20,weight: 1),
                    subviews: [
                        ServerRow(alignment: ServerAlignment.CENTER,
                            subviews: [
                                ServerTextV2(modifier: ServerModifier(weight: 1),textAlignment: ServerTextAlignment.CENTER,
                                             styledTexts: [
                                                ServerStyledText(text: "You have", size: 14, color: "#4C5870", weight: "500"),
                                                ServerStyledText(text: " 1 hour and 47 minutes ", size: 14, color: "#4C5870",weight: "700"),
                                                ServerStyledText(text: "of total activity in the past", size: 14, color: "#4C5870", weight: "500"),
                                                ServerStyledText(text: " week.", size: 14, color: "#4C5870",weight: "700"),
                                    ]
                                )
                            ]
                        )
                    ]
                )
                
            ]
        ),
        ServerSpacer(modifier: ServerModifier(height: 20)),
        ServerRow(modifier : ServerModifier(spacingStart: 10, spacingEnd: 10, spacingTop: 10, spacingBottom: 10, height: 100),subviews: [
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Left"),
                            ServerSpacer(),
                            ServerText(text: "Column Left Desc"),
                         ]),
            ServerSpacer(), // Spacer in weighted container will squished if has no width
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Right"),
                            ServerSpacer(),
                            ServerText(text: "Column Right Desc"),
                         ])
        ]),
        ServerRow(modifier : ServerModifier(spacingStart: 10, spacingEnd: 10, spacingTop: 10, spacingBottom: 10, height: 100),subviews: [
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Left"),
                            ServerSpacer(),
                            ServerText(text: "Column Left Desc"),
                         ]),
            ServerSpacer(modifier : ServerModifier(weight: 1)),
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Right"),
                            ServerSpacer(),
                            ServerText(text: "Column Right Desc"),
                         ])
        ]),
        ServerRow(subviews: [
            ServerSpacer(modifier: ServerModifier(width: 70)),
            ServerColumn(alignment: ServerAlignment.CENTER, subviews: [
                ServerText(text: "This is a multiline text that needs all lines to be center aligned.", textAlignment: .CENTER)
            ]),
            ServerSpacer(modifier: ServerModifier(width: 70)),
        ]),
        ServerRow(modifier: ServerModifier(spacingStart:20, spacingEnd: 20, backgroundColor: "#ff0000"), subviews: [
            ServerCard(modifier: ServerModifier(weight: 1), subviews: [
                ServerColumn(modifier: ServerModifier(spacingStart:20, spacingEnd: 20, spacingTop: 20, spacingBottom: 20, backgroundColor: "#0000ff"), subviews: [
                    ServerText(text: "List text in card"),
                    ServerText(text: "List text in card"),
                    ServerText(text: "List text in card")
                ])
            ])
        ]),
        ServerRow(spacing: 10, modifier : ServerModifier(spacingStart: 10, spacingEnd: 10, spacingTop: 10, spacingBottom: 10, height: 100),subviews: [
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Left"),
                            ServerSpacer(),
                            ServerText(text: "Column Left Desc"),
                         ]),
            ServerColumn(modifier : ServerModifier(weight: 1, backgroundColor: "#00ff00", cornerRadius: 16),
                         subviews: [
                            ServerText(text: "Column Right"),
                            ServerSpacer(),
                            ServerText(text: "Column Right Desc"),
                         ])
        ]),
        ServerRow(modifier: ServerModifier(height: 150, backgroundColor: "00ffff"), subviews: [
            ServerColumn(modifier: ServerModifier(weight: 1, backgroundColor: "#00ff00"), subviews: [
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#ff0000"), subviews: [
                    ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                ]),
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#0000ff"), subviews: [
                    ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                ])
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(modifier: ServerModifier(height: 150, backgroundColor: "00ffff"), subviews: [
            ServerColumn(modifier: ServerModifier(weight: 1, backgroundColor: "#00ff00"), subviews: [
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#ff0000"), subviews: [
                    ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                ]),
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(modifier: ServerModifier(height: 150, backgroundColor: "00ffff"), subviews: [
            ServerColumn(modifier: ServerModifier(weight: 1, backgroundColor: "#00ff00"), subviews: [
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#ff00ff"), subviews: [
                    ServerColumn(modifier: ServerModifier(weight: 0.5, backgroundColor: "#ff0000"), subviews: [
                        ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                    ])
                ]),
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerColumn(modifier: ServerModifier(height: 150, backgroundColor: "00ffff"), subviews: [
            ServerColumn(modifier: ServerModifier(weight: 1, backgroundColor: "#00ff00"), subviews: [
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#ff0000"), subviews: [
                    ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                ]),
                ServerRow(modifier: ServerModifier(weight: 0.5, backgroundColor: "#0000ff"), subviews: [
                    ServerText(text: "row/column/row/text", modifier: ServerModifier(backgroundColor: "#ffff00"))
                ])
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), subviews: [
            ServerRow(subviews: [
                ServerRow(modifier: ServerModifier(
                    spacingStart: 20,
                    spacingEnd: 20,
                    spacingTop: 20,
                    spacingBottom: 20,
                    weight: 1,
                    backgroundColor: "#00ff00",
                    cornerRadius: 20
                ), subviews: [
                    ServerText(text: "Row Border Background")
                ])
                
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(
            subviews: [
                ServerText(text: "Left 30", modifier: ServerModifier(weight: 0.3, backgroundColor: "#ff0000")),
                ServerText(text: "Mid 50", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
                ServerText(text: "Right 30", modifier: ServerModifier(weight: 0.3, backgroundColor: "#0000ff")),
            ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerColumn(modifier: ServerModifier(height: 200, backgroundColor: "#ffff00"), subviews: [
            ServerText(text: "Top 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
            ServerText(text: "Mid 50 is going to get really long", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
            ServerText(text: "Bottom 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
        ]),
        ServerRow(subviews: [
            ServerText(text: "Read Me"),
            ServerText(text: "Do Not Read", modifier: ServerModifier(adaText: "Read Me")),
            ServerText(text: "Read me Heading", isHeading: true),
            ServerImage(url: "Disappointed", modifier: ServerModifier(
                width: 20,
                height: 20,
                adaText: "Disappointed"
            )),
            ServerImage(url: "Disappointed", modifier: ServerModifier(width: 20, height: 20))
        ]),
        ServerRow(modifier: ServerModifier(adaText: "Read Me"), subviews: [
            ServerText(text: "Don't Read"),
            ServerText(text: "Don't Read", modifier: ServerModifier(adaText: "Don't Read"))
        ]),
        ServerCard(subviews: [
            ServerText(text: "Card")
        ]),
        ServerCard(modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30
        ), subviews: [
            ServerText(text: "Card Padding")
        ]),
        ServerCard(modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30,
            width: 200,
            height: 200
        ), subviews: [
            ServerColumn(subviews: [
                ServerText(text: "Card Padding HW"),
                ServerText(text: "Card 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ), alignment: .CENTER, subviews: [
            ServerText(text: "Col Center")
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), alignment: .END, subviews: [
            ServerText(text: "Col End")
        ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ), alignment: .CENTER, subviews: [
            ServerText(text: "Row Center")
        ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), alignment: .END, subviews: [
            ServerText(text: "Row End")
        ]),
        ServerRow(spacing: 20, modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30,
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 5
        ),
                  subviews: [
                    ServerText(text: "Row Padding HW"),
                    ServerText(text: "Row 2")
                  ]),
        ServerRow(spacing: 20, modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30,
            backgroundColor: "#ffff00",
            cornerRadius: 5
        ),
                  subviews: [
                    ServerText(text: "Row Padding HW"),
                    ServerText(text: "Row 2")
                  ]),
        ServerColumn(spacing: 20, modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30,
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ),
                     subviews: [
                        ServerText(text: "Col Padding HW"),
                        ServerText(text: "Col 2")
                     ]),
        ServerRow(modifier: ServerModifier(
            spacingStart: 30,
            spacingEnd: 30,
            spacingTop: 30,
            spacingBottom: 30,
            backgroundColor:"#ff0000",
            cornerRadius: 5
        ), subviews: [
            ServerText(text: "Row"),
            ServerColumn(modifier: ServerModifier(
                spacingStart: 30,
                spacingEnd: 30,
                spacingTop: 30,
                spacingBottom: 30,
                backgroundColor:"#00ff00",
                cornerRadius: 5
            ), subviews: [
                ServerText(text: "Col Padding HW"),
                ServerText(text: "Col 2")
            ])
        ]),
        ServerColumn(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor: "#00ff00",
            cornerRadius: 5
        ), subviews: [
            ServerText(text: "Col Spacer"),
            ServerSpacer(),
            ServerText(text: "Col Spacer")
        ]),
        ServerRow(modifier: ServerModifier(
            width: 200,
            height: 200,
            backgroundColor:"#ff0000",
            cornerRadius:5
        ), subviews: [
            ServerText(text: "Row Spacer"),
            ServerSpacer(),
            ServerText(text: "Row Spacer")
        ]),
        ServerRow(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            width: 200,
            height: 200,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), subviews: [
            ServerRow(modifier: ServerModifier(
                spacingStart: 20,
                spacingEnd: 20,
                spacingTop: 20,
                spacingBottom: 20,
                width: 160, // Those are 200 on Android, but should be 200 - (20 0 2) = 160 on iOS
                height: 160,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), subviews: [
                ServerText(text: "Row Border Background")
            ])
        ]),
        ServerRow(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), subviews: [
            ServerRow(modifier: ServerModifier(
                spacingStart: 20,
                spacingEnd: 20,
                spacingTop: 20,
                spacingBottom: 20,
                weight: 1,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), subviews: [
                ServerText(text: "Row Border Background")
            ])
        ]),
        ServerRow(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), subviews: [
            ServerColumn(modifier: ServerModifier(
                spacingStart: 20,
                spacingEnd: 20,
                spacingTop: 20,
                spacingBottom: 20,
                weight: 1,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), subviews: [
                ServerText(text: "Column Border Background")
            ])
        ]),
        ServerRow(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 20
        ), subviews: [
            ServerRow(modifier: ServerModifier(
                spacingStart: 20,
                spacingEnd: 20,
                spacingTop: 20,
                spacingBottom: 20,
                weight: 0.25,
                backgroundColor: "#00ff00",
                cornerRadius: 20
            ), subviews: [
                ServerText(text: "Row Border Background")
            ])
        ]),
        ServerRow(
            subviews: [
                ServerSpacer(modifier: ServerModifier(
                    height: 20, // we don't need a weight here because spacers on iOS take all space by default, tried on android it is also working same if we remove it and att it to ServerRow
                    backgroundColor: "#0000ff"
                ))
            ]),
        ServerRow(
            subviews: [
                ServerSpacer(),
                ServerSpacer(modifier: ServerModifier(
                    width: 50,
                    height: 20,
                    backgroundColor: "#0000ff"
                )),
                ServerSpacer()
            ]),
        ServerRow(subviews: [
            ServerImage(url: "Disappointed", modifier: ServerModifier(width: 20, height: 20)),
            ServerImage(url: "Disappointed", modifier: ServerModifier(spacingStart: 20, spacingEnd: 20, spacingTop: 20, spacingBottom: 20, width: 20, height: 20)) // This will be squished to zero since  we are adding 20 padding to 20x20 image because of the call order
        ]),
        ServerRow(
            subviews: [
                ServerText(text: "Left 25", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
                ServerText(text: "Mid 50", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
                ServerText(text: "Right 25", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
            ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(
            subviews: [
                ServerText(text: "Left 25", modifier: ServerModifier(
                    spacingStart: 20,
                    spacingEnd: 20,
                    spacingTop: 20,
                    spacingBottom: 20,
                    weight: 0.25,
                    backgroundColor: "#ff0000"
                )),
                ServerText(text: "Mid 50", modifier: ServerModifier(
                    spacingStart: 20,
                    spacingEnd: 20,
                    spacingTop: 20,
                    spacingBottom: 20,
                    weight: 0.5,
                    backgroundColor: "#00ff00"
                )),
                ServerText(text: "Right 25", modifier: ServerModifier(
                    spacingStart: 20,
                    spacingEnd: 20,
                    spacingTop: 20,
                    spacingBottom: 20,
                    weight: 0.25,
                    backgroundColor: "#0000ff"
                )),
            ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(subviews: [
            ServerRow(modifier: ServerModifier(width: 200), subviews: [
                ServerText(text: "Left 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
                ServerText(text: "Mid 50 is going to get really long", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
                ServerText(text: "Right 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
            ])
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerRow(modifier: ServerModifier(backgroundColor: "#ffff00"), subviews: [
            ServerText(text: "Left 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
            ServerText(text: "Mid 50 is going to get really long", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
            ServerText(text: "Right 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
        ]),
        ServerSpacer(modifier: ServerModifier(height: 10)),
        ServerColumn(modifier: ServerModifier(height: 200, backgroundColor: "#ffff00"), subviews: [
            ServerText(text: "Top 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#ff0000")),
            ServerText(text: "Mid 50 is going to get really long", modifier: ServerModifier(weight: 0.5, backgroundColor: "#00ff00")),
            ServerText(text: "Bottom 25 is going to get really long", modifier: ServerModifier(weight: 0.25, backgroundColor: "#0000ff")),
        ]),
        ServerCard(modifier: ServerModifier(
            spacingStart: 20,
            spacingEnd: 20,
            spacingTop: 20,
            spacingBottom: 20,
            backgroundColor: "#ff0000",
            cornerRadius: 60
        ),subviews: [
            ServerText(text: "Card BG", modifier: ServerModifier(backgroundColor: "#ff0000"))
        ]),
        ServerRow(subviews: [
            ServerText(text: "Text is going to get really long.Left 30 is going to get really long", modifier: ServerModifier(backgroundColor: "#ff0000")),
            ServerText(text: "Text", modifier: ServerModifier(backgroundColor: "#00ff00"))
        ]),
        ServerRow(
            subviews: [
                ServerSpacer(modifier: ServerModifier(
                    spacingStart: 20, spacingEnd: 20, spacingTop: 20, spacingBottom: 20, weight: 1, backgroundColor: "#ff0000", cornerRadius: 20
                ))
            ]),
        ServerText(
            text: "Test",
            modifier: ServerModifier(
                spacingStart: 20,
                spacingEnd: 20,
                spacingTop: 20,
                spacingBottom: 20,
                backgroundColor: "#ff0000",
                cornerRadius: 60
            )
        ),
        ServerImage(url: "Running", tint: "#ff0000", modifier: ServerModifier(width: 20, height: 20)),
        ServerRow(subviews: [
            ServerBox(modifier: ServerModifier(weight: 1),subviews: [
                ServerRow(modifier: ServerModifier(weight: 1), subviews: [
                    ServerImage(url: "Background", contentScale: .FILL_HEIGHT, alignment: .TOP_END, modifier: ServerModifier(weight: 1, aspectRatio: 1.2))
                ]),
                ServerColumn(modifier: ServerModifier(weight: 1, aspectRatio: 1.2), // Normally aspectRatio modifier only works for images (also maybe shapes) on swiftui, I added manual calculations for it but it only runs if server view size is calculated manually (if view has a fixed height or fixed width or a weight)
                             subviews: [
                                ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000")),
                                ServerSpacer(),
                                ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000"))
                             ])
            ])
            
        ]),
        ServerRow(subviews: [
            ServerBox(modifier: ServerModifier(weight: 1),subviews: [
                ServerRow(modifier: ServerModifier(weight: 1), subviews: [
                    ServerImage(url: "Background", contentScale: .FILL_WIDTH, alignment: .BOTTOM_END, modifier: ServerModifier(weight: 1, aspectRatio: 3))
                ]),
                ServerRow(modifier: ServerModifier(weight: 1, aspectRatio: 3), // Normally aspectRatio modifier only works for images (also maybe shapes) on swiftui, I added manual calculations for it but it only runs if server view size is calculated manually (if view has a fixed height or fixed width or a weight)
                          subviews: [
                            ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000")),
                            ServerSpacer(),
                            ServerText(text: "Overlay", modifier: ServerModifier(backgroundColor: "#FF0000"))
                          ])
            ])
        ]),
        ServerImage(url: "Background", contentScale: .FILL_WIDTH, alignment: .CENTER_CENTER, modifier: ServerModifier(width: 100, height: 100)),
        ServerImage(url: "Background", contentScale: .FILL_HEIGHT, alignment: .CENTER_END, modifier: ServerModifier(width: 100, height: 200)),
        ServerImage(url: "Background", contentScale: .CROP, alignment: .CENTER_END, modifier: ServerModifier(width: 100, height: 100)),
        ServerImage(url: "Background", contentScale: .FIT, alignment: .CENTER_CENTER, modifier: ServerModifier(width: 100, height: 100)),
        ServerImage(url: "Background", contentScale: .FILL_WIDTH, alignment: .CENTER_CENTER, modifier: ServerModifier(width: 200, height: 100))
    ]
}
