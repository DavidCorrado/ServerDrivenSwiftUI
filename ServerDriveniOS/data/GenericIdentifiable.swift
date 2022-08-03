//
//  GenericIdentifiable.swift
//  ServerDriveniOS
//
//  Created by David Corrado on 7/6/22.
//

import Foundation

protocol GenericIdentifiable {
    var id: UUID { get }
    var modifier: ServerModifier? { get }
}
