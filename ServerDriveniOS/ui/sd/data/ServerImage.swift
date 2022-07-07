//
//  ServerImage.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerImage: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.IMAGE
    var id = UUID()
    var drawableRes: String
    var adaText: String?
    var modifier: ServerModifier?
}
