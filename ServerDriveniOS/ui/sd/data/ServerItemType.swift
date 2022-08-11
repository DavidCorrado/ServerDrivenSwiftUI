//
//  ServerItemType.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

enum ServerItemType: String, Decodable {
    case TEXT
    case SPACER
    case CARD
    case ROW
    case COLUMN
    case BOX
    case IMAGE
    case BUBBLE
}
