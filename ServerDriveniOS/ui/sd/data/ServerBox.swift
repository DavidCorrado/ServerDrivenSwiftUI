//
//  ServerBox.swift
//  ServerDriveniOS
//
//  Created by Firat Özsarıkamış on 28.07.2022.
//

import UIKit

struct ServerBox: ServerView, ServerWeightedContainer {
    var type: ServerItemType = .BOX
    var id = UUID()
    var modifier: ServerModifier?
    var items: [ServerView]
    var spacing: CGFloat? { nil }
    var weightDirection: WeightDirection { .none }
}
