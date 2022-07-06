//
//  ServerRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation

struct ServerRow: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.ROW
    var id = UUID()
    var spacing: Float?
    var modifier: ServerModifier?
    var alignment: ServerAlignment?
    var items: [AnyObject]
}
