//
//  Testing.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/11/22.
//

import Foundation
import SwiftUI
// struct Testing_Previews: PreviewProvider {
//    static var previews: some View {
//        HStack{
//            Text("test")
//            Image("Disappointed").resizable().frame(width: 24, height: 22).padding(.trailing,20).padding(.leading,20)
//            Text("test2")
//        }
//    }
// }

struct Testing2_Previews: PreviewProvider {
    static var previews: some View {
        SDContent(items: testing())
    }
}

func testing() -> [ServerCard] {
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
            width: 200, height: 200
        ), items: [
            ServerText(text: "Card Padding HW")
        ])
    ]
}
