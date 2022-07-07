//
//  ServerColumn.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import UIKit

struct ServerColumn: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.COLUMN
    var id = UUID()
    var spacing: CGFloat?
    var modifier: ServerModifier?
    var alignment: ServerAlignment?
    var color: String?
    var colorCornerRadius: Float?
    var items: [GenericIdentifiable]
}
