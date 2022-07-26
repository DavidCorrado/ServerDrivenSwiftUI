//
//  ServerWeightedContainer.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 26.07.2022.
//

import SwiftUI

protocol ServerWeightedContainer {
    var spacing: CGFloat? { get }
    var modifier: ServerModifier? { get }
    var items: [GenericIdentifiable] { get }
}
