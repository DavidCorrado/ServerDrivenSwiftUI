//
//  ServerText.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerText: GenericIdentifiable {
    var type: ServerItemType = ServerItemType.TEXT
    var id = UUID()
    var text: String
    var size: Int?
    var style: FontType?
    var color: String?
    var decoration: [DecorationType] = []
    var weight: String?
    var isHeading: Bool?
    var modifier: ServerModifier?
}

enum DecorationType {
    case STRIKETHROUGH
    case UNKNOWN
}

enum FontType {
    case NORMAL
    case ITALIC
    case UNKNOWN
}
