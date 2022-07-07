//
//  ServerRow.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 6/30/22.
//

import Foundation
import UIKit

struct ServerRow: GenericIdentifiable{
    var type: ServerItemType = ServerItemType.ROW
    var id = UUID()
    var spacing: CGFloat?
    var modifier: ServerModifier?
    var alignment: ServerAlignment?
    var items: [GenericIdentifiable]
}
