//
//  ServerCard.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerCard: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.CARD
    var id = UUID()
    var modifier: ServerModifier?
    var items: [GenericIdentifiable]
}
