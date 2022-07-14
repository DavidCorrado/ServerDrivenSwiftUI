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
//        ScrollView {
//            LazyVStack(alignment: .leading, spacing: 0) {
//                VStack(alignment: .leading) {
//                    Text("Test")
//                }.cornerRadius(10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10)
//                            .stroke(Color.gray, lineWidth: 1)
//                    ).frame(width: 200, height: 200)
//            }
//        }
//    }
// }

// struct Testing2_Previews: PreviewProvider {
//    static var previews: some View {
//        SDContent(items: testing())
//    }
// }
//
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
            paddingStart: 30, paddingEnd: 30, paddingTop: 30,  paddingBottom: 30, width: 200, height: 200
        ), items: [
            ServerText(text: "Card Padding HW")
        ])
    ]
}
