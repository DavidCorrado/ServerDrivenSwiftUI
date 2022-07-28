//
//  ServerBox.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 28.07.2022.
//

import Foundation

struct ServerBox: GenericIdentifiable {
    var type: ServerItemType = .BOX
    var id = UUID()
    var modifier: ServerModifier?
    var items: [GenericIdentifiable]
}
