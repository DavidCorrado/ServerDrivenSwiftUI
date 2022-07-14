//
//  ServerText.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import SwiftUI

struct ServerText: GenericIdentifiable {
    var type: ServerItemType = .TEXT
    var id = UUID()
    var text: String
    var size: Int?
    var style: FontType?
    var color: String?
    var decoration: [DecorationType] = []
    var weight: String?
    var isHeading: Bool?
    var modifier: ServerModifier?
    func fontWeight() -> Font.Weight {
        switch weight {
            case "100": return .light
            case "200": return .light
            case "300": return .light
            case "400": return .regular
            case "500": return .medium
            case "600": return .semibold
            case "700": return .bold
            case "800": return .heavy
            case "900": return .black
            default: return .regular
        }
    }
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
