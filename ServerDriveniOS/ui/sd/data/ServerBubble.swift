//
//  ServerBubble.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerBubble: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.BUBBLE
    var id = UUID()
    var text: ServerText
    var textADA: String?
    var drawableRes: Int?
    var backgroundColor: String?
    var strokeColor: String?
    var modifier: ServerModifier?
}
