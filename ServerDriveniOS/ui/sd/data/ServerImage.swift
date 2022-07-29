//
//  ServerImage.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import SwiftUI

struct ServerImage: GenericIdentifiable {
    var type: ServerItemType = .IMAGE
    var id = UUID()
    var drawableRes: String
    var tint: String?
    var contentScale: ImageContentScale?
    var alignment: ImageAlignment?
    var modifier: ServerModifier?
}

enum ImageContentScale {
    case NONE
    case FILL_HEIGHT
    case FILL_WIDTH
    case CROP
    case FIT
}

enum ImageAlignment {
    case TOP_START
    case TOP_CENTER
    case TOP_END
    case CENTER_START
    case CENTER_CENTER
    case CENTER_END
    case BOTTOM_START
    case BOTTOM_CENTER
    case BOTTOM_END
    
    var alignment: Alignment {
        switch self {
        case .TOP_START:
            return .topLeading
        case .TOP_CENTER:
            return .top
        case .TOP_END:
            return .topTrailing
        case .CENTER_START:
            return .leading
        case .CENTER_CENTER:
            return .center
        case .CENTER_END:
            return .trailing
        case .BOTTOM_START:
            return .bottomLeading
        case .BOTTOM_CENTER:
            return .bottom
        case .BOTTOM_END:
            return .bottomTrailing
        }
    }
}
